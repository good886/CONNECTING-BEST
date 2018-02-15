<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroComprador.aspx.cs" Inherits="Connecting.Web.RegistroComprador"   meta:resourcekey="PageResource1" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

        <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="Content/css/Login/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/Login/style.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/Login/font-awesome.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="Content/Images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="Content/Images/favicon.ico" type="image/x-icon">

    <link href="Content/Css/RegistroComprador.css" rel="stylesheet" />
    <script type="text/javascript">
        
        function VerificarClave(s, e) {

            if (e.value != null && e.value.length < 8) {
                e.isValid = false;
                if (cmbIdiomas.GetValue() == "es-GT")
                    e.errorText = "La clave debe tener al menos ocho caracteres";
                else
                    e.errorText = "Password must be at least eight characters";
            } else {

                txtClave.SetIsValid(true);
                txtConfirmarClave.SetIsValid(true);
                var valido = txtClave.GetText() == txtConfirmarClave.GetText();

                if (!valido) {
                    valido = ((txtClave.GetText() == "") || (txtConfirmarClave.GetText() == ""));
                }
                if (!valido) {
                    e.isValid = false;
                }
            }
        }

        function OnRolSelected(s,e) {
            cmbSocios.SetVisible(s.GetValue() == 'S');
            txtNombreEmpresa.SetEnabled(s.GetValue() == 'C');
            cmbPais.SetEnabled(s.GetValue() == 'C');
            cmbPais.SetValue("GT");
            cmbSocios.SetFocus();
        }

        function OnSocioSelected(s,e) {
            txtNombreEmpresa.SetText(s.GetText());
        }


        function OnAceptarMensaje() {
            popMensajes.Hide();
            if (txtMensaje.GetText().indexOf("Registro guardado exitosamente")==0 ||
                txtMensaje.GetText().indexOf("You have successfully registered")==0) {
                window.location.href = "FormLogin.aspx";
            }

        }
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- #include file ="templates\header.inc" -->

        <div id="divHeader">

            <div style="float: right">
                <dx:ASPxComboBox ID="cmbIdiomas" runat="server"  AutoPostBack="True"
                    OnSelectedIndexChanged="cmbIdiomas_SelectedIndexChanged" ClientInstanceName="cmbIdiomas" meta:resourcekey="cmbIdiomasResource1">
                    <Items>
                        <dx:ListEditItem Text="Español" Value="es-GT" meta:resourcekey="ListEditItemResource1" />
                        <dx:ListEditItem Text="Ingles" Value="en-US" meta:resourcekey="ListEditItemResource2" />
                    </Items>
                </dx:ASPxComboBox>
            </div>
        </div>
       <div id="divMain">
            <dx:ASPxFormLayout ID="flyPerfilComprador" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                AlignItemCaptionsInAllGroups="True" Width="100%" Theme="Moderno" meta:resourcekey="flyPerfilCompradorResource1" >
                <Items>

                    <dx:LayoutGroup Caption="Registro de Usuario" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" meta:resourcekey="LayoutGroupResource1" >
                        <Items>
                            <dx:LayoutItem Caption="" meta:resourcekey="LayoutItemResource1" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1" >
                                        <dx:ASPxLabel ID="lblCamposRequeridos" runat="server" Text="Los campos marcados con un * son obligatorios" ForeColor="#006600" meta:resourcekey="lblCamposRequeridosResource1" >
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Registrarse como:" meta:resourcekey="LayoutItemResource2" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2" >
                                        <dx:ASPxRadioButtonList ID="rbtRol" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" SelectedIndex="0" Theme="Moderno" meta:resourcekey="rbtRolResource1" >
                                            <ClientSideEvents ValueChanged="OnRolSelected" />
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Comprador" Value="C" meta:resourcekey="ListEditItemResource3"  />
                                                <dx:ListEditItem Text="Socio" Value="S" meta:resourcekey="ListEditItemResource4"  />
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxRadioButtonList>
                                        <dx:ASPxComboBox ID="cmbSocios" runat="server" AutoResizeWithContainer="True" ClientVisible="False"  
                                            NullText="Seleccione un registro" TextField="NombreComercial" Theme="Moderno" ValueField="Nit" Width="100%" ClientInstanceName="cmbSocios" meta:resourcekey="cmbSociosResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                            <ClientSideEvents ValueChanged="OnSocioSelected"></ClientSideEvents>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Left" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Correo electrónico:" meta:resourcekey="LayoutItemResource3" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3" >
                                        <dx:ASPxTextBox ID="txtCorreo" runat="server" Theme="Moderno" Width="100%" MaxLength="150" meta:resourcekey="txtCorreoResource1"  ClientInstanceName="txtCorreo">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                <RegularExpression ErrorText="Correo inválido!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Contraseña:" meta:resourcekey="LayoutItemResource4" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4" >
                                        <dx:ASPxTextBox ID="txtClave" runat="server" Theme="Moderno" Width="100%" MaxLength="25"  Password="True" ClientInstanceName="txtClave" meta:resourcekey="txtClaveResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ErrorText="Las claves no coinciden">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                            <ClientSideEvents Validation="VerificarClave"></ClientSideEvents>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Confirmar contraseña:" meta:resourcekey="LayoutItemResource5" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource5" >
                                        <dx:ASPxTextBox ID="txtConfirmarClave" runat="server" Theme="Moderno" Width="100%" MaxLength="25"  Password="True" ClientInstanceName="txtConfirmarClave" meta:resourcekey="txtConfirmarClaveResource1">
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" ErrorText="Las claves no coinciden">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                            <ClientSideEvents Validation="VerificarClave"></ClientSideEvents>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Nombre de la Empresa:" meta:resourcekey="LayoutItemResource6" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource6" >
                                        <dx:ASPxTextBox ID="txtNombreEmpresa" runat="server" Theme="Moderno" Width="100%" MaxLength="150" 
                                            meta:resourcekey="txtNombreEmpresaResource1" ClientInstanceName="txtNombreEmpresa" >
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True" >
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="País:" meta:resourcekey="LayoutItemResource7" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource7" >
                                        <dx:ASPxComboBox ID="cmbPais" runat="server" NullText="Seleccione un registro" Theme="Moderno" ValueType="System.String" Width="100%"
                                            TextField="NombrePais" ValueField="IdPais" meta:resourcekey="cmbPaisResource1" ClientInstanceName="cmbPais" >
                                            <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>

                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Codigo de Verificación:" meta:resourcekey="LayoutItemResource8" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource8" >
                                        <dx:ASPxCaptcha ID="capComprador" runat="server" Theme="Moderno" Width="100%" meta:resourcekey="capCompradorResource1" >
                                            <ChallengeImage ForegroundColor="#000000">
                                            </ChallengeImage>
                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                <RequiredField ErrorText="Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxCaptcha>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="" CaptionSettings-Location="Right" meta:resourcekey="LayoutItemResource9" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource9" >
                                        <dx:ASPxButton ID="btnRegistrar" runat="server" Text="Registrarme" Theme="Moderno" Width="50%"  OnClick="btnRegistrar_Click" meta:resourcekey="btnRegistrarResource1">
                                        </dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Right"></CaptionSettings>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                </Items>
                <Styles>
                    <LayoutGroupBox>
                        <Caption CssClass="layoutGroupBoxCaption"></Caption>
                    </LayoutGroupBox>
                </Styles>
            </dx:ASPxFormLayout>

            <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
                Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" meta:resourcekey="popMensajesResource1" >
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1" >
                        <div style="clear: both">
                            <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje"
                                meta:resourcekey="txtMensajeResource1" >
                                <Border BorderStyle="None" />
                            </dx:ASPxMemo>
                        </div>
                        <div style="width: 120px; margin: 0 auto;">
                            <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno"  AutoPostBack="False" meta:resourcekey="btnAceptarMsgResource1" >
                                <ClientSideEvents Click="OnAceptarMensaje"></ClientSideEvents>
                            </dx:ASPxButton>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>






    </form>

    
</body>
</html>
