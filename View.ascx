<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="Christoc.Modules.DNNSignalR.View" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/labelcontrol.ascx" %>

<script src="/desktopmodules/SignalRChat/Scripts/jquery.signalR-1.0.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src='<%= ResolveClientUrl("~/signalr/hubs") %>'></script>



<script type="text/javascript">
    $(function () {
        var dnnHub = $.connection.chatHub;
        // Declare a function on the chat hub so the server can invoke it
        dnnHub.client.addMessage = function (message) {
            $('#messages').append('<li>' + message + '</li>');
        };

        // Start the connection, and when it completes successfully wire up the click handler for the link
        $.connection.hub.start().done(function () {
            $("#linkSubmit").click(function () {
                // Call the chat method on the server
                dnnHub.server.send($('#msg').val());
            });
        });
    });
</script>

<dnn:label id="lblChatMessage" runat="server" />
<input type="text" id="msg" />
<a href="#" id="linkSubmit" class="dnnPrimaryAction">
    <asp:Label runat="server" ID="lbSubmit" resourcekey="lbSubmit.Text"></asp:Label></a>
<ul id="messages">
</ul>
