<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">
    protected void Button_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
    }
</script>
<html>
<head runat="server">
    <title></title>
    <script src="https://cdn.jsdelivr.net/jquery/1.11.1/jquery.min.js"></script>
    <!--[if lte IE 8]><script>[].map||(Array.prototype.map=function(a){for(var b=this,c=b.length,d=[],e=0,f;e<b;)d[e]=e in b?a.call(arguments[1],b[e],e++,b):f;return d})</script><![endif]-->
    <script src="jquery.overlayspinner.js"></script>
    <style>
        .container { border: 2px solid #666; padding: 30px; border-radius: 10px; background-color: #eee; margin-bottom: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />

        <p>ASP.NET UpdatePanel with outside AsyncPostBackTrigger controls:</p>
        <asp:UpdatePanel runat="server" class="container" data-overlayspinner="">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonOutside" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Button runat="server" Text="Async PostBack" OnClick="Button_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:Button runat="server" ID="ButtonOutside" OnClick="Button_Click" Text="Outside Async PostBack" />

        <p>ASP.NET UpdatePanel with inner controls only:</p>
        <asp:UpdatePanel runat="server" class="container" data-overlayspinner="">
            <ContentTemplate>
                <asp:Button runat="server" Text="Async PostBack" OnClick="Button_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
