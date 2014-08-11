<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">
    protected void Button_Click(object sender, EventArgs e)
    {
    }
    protected override void OnInit(EventArgs e)
    {
        if (IsPostBack)
            System.Threading.Thread.Sleep(1000);
        base.OnInit(e);
    }
</script>
<html>
<head runat="server">
    <title></title>
    <script src="https://cdn.jsdelivr.net/jquery/2.1.1/jquery.min.js"></script>
    <script src="jquery.overlayspinner.js"></script>
    <style>
        .container { border: 2px solid #666; padding: 10px 15px; border-radius: 10px; background-color: yellow; margin-bottom: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />

        <p>Normal postback (no overlay):</p>
        <div class="container">
            Press this button
            <asp:Button runat="server" Text="Normal Postback" OnClick="Button_Click" />
        </div>

        <hr>

        <p>Binding to ASP.NET UpdatePanel with outside AsyncPostBackTrigger controls:</p>
        <!-- The UpdatePanel provides its own container div that will bind to -->
        <asp:UpdatePanel runat="server" class="container" data-overlayspinner="">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonOutside" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                Press this button
                    <asp:Button runat="server" Text="AJAX Postback" OnClick="Button_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button runat="server" ID="ButtonOutside" Text="and trigger above UpdatePanel from outside" />

        <hr>

        <p>Binding to ASP.NET UpdatePanel with inner controls only:</p>
        <asp:UpdatePanel runat="server" class="container" data-overlayspinner="">
            <ContentTemplate>
                Press this button
                    <asp:Button runat="server" Text="AJAX Postback" OnClick="Button_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
