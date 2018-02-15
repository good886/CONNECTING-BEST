<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormCambiarClave.aspx.cs" Inherits="Connecting.Web.FormCambiarClave" Culture="auto" meta:resourcekey="PageResource1" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <style type="text/css">
        .negativeBar {
            background-color: #E8E8E8;
        }

        .pwdBlankBar .positiveBar {
            width: 0%;
        }

        .pwdBlankBar .negativeBar {
            width: 100%;
        }

        .pwdWeakBar .positiveBar {
            background-color: Red;
            width: 30%;
        }

        .pwdWeakBar .negativeBar {
            width: 70%;
        }

        .pwdFairBar .positiveBar {
            background-color: #FFCC33;
            width: 65%;
        }

        .pwdFairBar .negativeBar {
            width: 35%;
        }

        .pwdStrengthBar .positiveBar {
            background-color: Green;
            width: 100%;
        }

        .pwdStrengthBar .negativeBar {
            width: 0%;
        }
    </style>

    <script type="text/javascript">

        /*  Complejidad de la clave */
        var minPwdLength = 8;
        var strongPwdLength = 8;

        function UpdateIndicator() {
            var strength = GetPasswordStrength(txtNuevaClave.GetText());

            var className;
            var message;
            if (strength == -1) {
                className = 'pwdBlankBar';
                message = "";
            } else if (strength == 0) {
                className = 'pwdBlankBar';
                message = "Too short";
            } else if (strength <= 0.2) {
                className = 'pwdWeakBar';
                message = lblNivel1.GetText();
            } else if (strength <= 0.6) {
                className = 'pwdFairBar';
                message = lblNivel2.GetText();
            } else {
                className = 'pwdStrengthBar';
                message = lblNivel3.GetText();
            }

            // update css and message
            var bar = document.getElementById("PasswordStrengthBar");
            bar.className = className;
            lbMessagePassword.SetValue(message);
            if (strength > 0.2)
                btnAceptarCambioClave.SetEnabled(true);
            else
                btnAceptarCambioClave.SetEnabled(false);
        }

        function GetPasswordStrength(password) {
            if (password.length == 0) return -1;
            //if (password.length < minPwdLength) return 0;

            var rate = 0;
            if (password.length >= strongPwdLength) rate++;
            if (password.match(/[0-9]/)) rate++;
            if (password.match(/[a-z]/)) rate++;
            if (password.match(/[A-Z]/)) rate++;
            if (password.match(/[!,@,#,$,%,^,&,*,?,_,~,\-,(,),\s,\[,\],+,=,\,,<,>,:,;]/)) rate++;
            return rate / 5;
        }

        function ConfirmedPassword_OnValidation(s, e) {
            if (txtNuevaClave.GetValue() != txtNuevaClaveConfirmar.GetValue()) {
                e.isValid = false;
                e.errorText = lblClavesNoCoinciden.GetText();
            }
        }


        /* Cambiar clave */
        function cambiarClave(s, e) {

            if (ASPxClientEdit.ValidateGroup('valCambiarClave')) {

                if (txtNuevaClave.GetText() == txtNuevaClaveConfirmar.GetText()) {
                    btnAceptarCambioClave.SetEnabled(false);
                    callback.PerformCallback("cambarclave");
                } else {
                    alert(lblClavesNoCoinciden.GetText());
                }
            }
        }

        function cancelar(s, e) {
            window.location.href = "Default.aspx";
        }

        /* Mensajes al finalize el callback*/
        function endCallback(s, e) {
            btnAceptarCambioClave.SetEnabled(true);
            txtMensaje.SetText(e.result.toString());
            if (!e.result.toString().startsWith("Error"))
                Limpiar();
            popMensajes.Show();

        }

        function Limpiar() {
            txtClaveActual.SetText("");
            txtNuevaClave.SetText("");
            txtNuevaClaveConfirmar.SetText("");
            strongPwdLength = -1;
            UpdateIndicator();
        }

        //function ASPxClientEdit.ClearGroup( validationGroup : String );

    </script>


    <div class="form-titulo">
        <%--<div class="form-titulo-titulo">--%>
        <dx:ASPxLabel ID="lblTitulo" runat="server" Text="Cambiar contraseña" ClientInstanceName="lblTitulo" CssClass="form-titulo-titulo" ForeColor="Black" meta:resourcekey="lblTituloResource1"></dx:ASPxLabel>
        <%--</div>--%>
    </div>
<%--    <div class="contenido">--%>
    <div>
        <dx:ASPxLabel ID="lblClavesNoCoinciden" runat="server" Text="La nueva clave no coincide con la confirmación" ClientVisible="False" ClientInstanceName="lblClavesNoCoinciden" meta:resourcekey="lblClavesNoCoincidenResource1"></dx:ASPxLabel>
        <dx:ASPxLabel ID="lblNivel1" runat="server" Text="Bajo" ClientVisible="False" ClientInstanceName="lblNivel1" meta:resourcekey="lblNivel1Resource1"></dx:ASPxLabel>
        <dx:ASPxLabel ID="lblNivel2" runat="server" Text="Medio" ClientVisible="False" ClientInstanceName="lblNivel2" meta:resourcekey="lblNivel2Resource1"></dx:ASPxLabel>
        <dx:ASPxLabel ID="lblNivel3" runat="server" Text="Alto" ClientVisible="False" ClientInstanceName="lblNivel3" meta:resourcekey="lblNivel3Resource1"></dx:ASPxLabel>

        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Theme="Moderno" meta:resourcekey="ASPxFormLayout1Resource1">
            <Items>
                <dx:LayoutGroup GroupBoxDecoration="None" HorizontalAlign="Right" meta:resourcekey="LayoutGroupResource1">
                    <Items>
                        <dx:LayoutItem Caption="Clave actual:" HelpText="Ingrese su clave actual" meta:resourcekey="LayoutItemResource1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1">
                                    <dx:ASPxTextBox ID="txtClaveActual" runat="server" Theme="Moderno" Width="300px" ClientInstanceName="txtClaveActual" Password="True" NullText="Clave actual" meta:resourcekey="txtClaveActualResource1">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" ValidationGroup="valCambiarClave">
                                            <RegularExpression ErrorText="" />
                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="Nueva clave" HelpText="Mínimo (8) caracteres, debe contener al menos una letra y un numero" meta:resourcekey="LayoutItemResource2">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNuevaClave" runat="server" Theme="Moderno" Width="300px" ClientInstanceName="txtNuevaClave" Password="True" NullText="Nueva clave" meta:resourcekey="txtNuevaClaveResource1">
                                                    <ClientSideEvents KeyUp="UpdateIndicator" TextChanged="UpdateIndicator" />
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valCambiarClave">
                                                        <RegularExpression ValidationExpression=".{8,}" ErrorText="Se requiren un mínimo de 8 caracteres" />
                                                        <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td>
                                                <dx:ASPxLabel ID="lbMessagePassword" ClientInstanceName="lbMessagePassword" runat="server" Text="Nivel de seguridad" ForeColor="#999999" meta:resourcekey="lbMessagePasswordResource1">
                                                </dx:ASPxLabel>
                                                <table id="PasswordStrengthBar" class="pwdBlankBar" border="0" cellspacing="0" cellpadding="0"
                                                    style="height: 4px; width: 220px">
                                                    <tbody>
                                                        <tr>
                                                            <td id="PositiveBar" class="positiveBar"></td>
                                                            <td id="NegativeBar" class="negativeBar"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Confirmar clave" HelpText="Ingrese nuevamente la clave" meta:resourcekey="LayoutItemResource3">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3">
                                    <dx:ASPxTextBox ID="txtNuevaClaveConfirmar" runat="server" Theme="Moderno" Width="300px" ClientInstanceName="txtNuevaClaveConfirmar" Password="True" NullText="Confirmar clave" meta:resourcekey="txtNuevaClaveConfirmarResource1">
                                        <ClientSideEvents Validation="ConfirmedPassword_OnValidation" />
                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valCambiarClave">
                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup ColCount="2" GroupBoxDecoration="HeadingLine" ShowCaption="False" meta:resourcekey="LayoutGroupResource2">
                    <Items>
                        <dx:LayoutItem ShowCaption="False" meta:resourcekey="LayoutItemResource4">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4">
                                    <dx:ASPxButton ID="btnAceptarCambioClave" runat="server" Text="Cambiar Password" Theme="Moderno" ClientInstanceName="btnAceptarCambioClave" AutoPostBack="False"
                                        ValidationGroup="valCambiarClave" ClientEnabled="False" meta:resourcekey="btnAceptarCambioClaveResource1">
                                        <ClientSideEvents Click="cambiarClave"></ClientSideEvents>
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" meta:resourcekey="LayoutItemResource5">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                    <dx:ASPxButton ID="btnCancelarCambioClave" runat="server" Text="Cancelar" Theme="Moderno" ClientInstanceName="btnCancelarCambioClave" AutoPostBack="False" meta:resourcekey="btnCancelarCambioClaveResource1">
                                        <ClientSideEvents Click="cancelar" />
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>
    </div>

    <dx:ASPxCallback ID="callback" runat="server" ClientInstanceName="callback" OnCallback="callback_Callback">
        <ClientSideEvents CallbackComplete="endCallback"></ClientSideEvents>
    </dx:ASPxCallback>

    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" meta:resourcekey="popMensajesResource1">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje" meta:resourcekey="txtMensajeResource1">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False" meta:resourcekey="btnAceptarMsgResource1">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide();}"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
