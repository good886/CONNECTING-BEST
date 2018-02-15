<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormLogin.aspx.cs" Inherits="Connecting.Web.FormLogin" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="Content/Css/Login/Login.css" type="text/css" />
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
    <title>Inicio de Sesion</title>
</head>
<body>
    <%--<form id="form1" runat="server">--%>
    <div id="contenedor" style="height: 100%; height: 100%;">
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <img src="Content/Images/Logo Master Match.png" height="140px" width="300px" alt="" />
                    </a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                        <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse navbar-menubuilder">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">INICIO</a> </li>
                        <li><a href="#">POLITICAS</a> </li>
                        <li><a href="#">CONTACTENOS</a> </li>
                    </ul>
                </div>
            </div>
        </div>
        <form id="form1" runat="server">
            <div class="container">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center">
                    <div id="banner">
                        <h1 class="col-md-12">HACER DE GUATEMALA
                        <br />
                            <strong>UN PAÍS EXPORTADOR </strong></h1>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="registrationform">
                        <div class="form-horizontal">

                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblError" runat="server" EnableViewState="False" ForeColor="#CC0000"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                            <%--                        </form>--%>
                        </div>
                        <div class="form-horizontal">
                            <fieldset>
                                <legend>CONNECTING BEST MARKET<br />
                                    <i class="fa fa-user text-center"></i></legend>
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Usuario" CssClass="col-lg-2 control-label"></asp:Label>
                                    <div class="col-lg-10">

                                        <dx:ASPxTextBox ID="txtNombreUsuario" runat="server" Height="50px" NullText="Usuario" Width="300px" MaxLength="50"
                                            Font-Bold="True" Font-Size="16pt" HorizontalAlign="Center">
                                            <NullTextStyle Font-Italic="True" Font-Size="14px" ForeColor="#CCCCCC"></NullTextStyle>
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                            <CaptionStyle ForeColor="White"></CaptionStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                                    <div class="col-lg-10">
                                        <dx:ASPxTextBox ID="txtClave" runat="server" Height="50px" NullText="Password" Password="True" Width="300px" MaxLength="16"
                                            Font-Bold="True" Font-Size="16pt" HorizontalAlign="Center">
                                            <NullTextStyle Font-Italic="True" Font-Size="14px" ForeColor="#CCCCCC"></NullTextStyle>
                                            <ValidationSettings CausesValidation="True" Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True">
                                                <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </div>
                                </div>


                                <div class="form-group">

                                    <dx:ASPxHyperLink ID="lnkOlvidoContraseña" runat="server" Text="¿Ha olvidado su contraseña?" NavigateUrl="FormContraseniaEnviar.aspx">
                                    </dx:ASPxHyperLink>

                                    <<dx:ASPxButton ID="btnAceptar" runat="server" Text="Ingresar" Width="100%"
                                        OnClick="btnAceptar_Click" CssClass="LoginButton" EnableTheming="False" Font-Bold="True">
                                    </dx:ASPxButton>


                                    <asp:Label ID="lblInfoRegistro" runat="server" Text="¿Todavía no tienes una cuenta? Introduzca su dirección de correo electrónico aquí para registrar tu cuenta de miembro activo" Width="300px" Font-Size="9pt"></asp:Label>
                                    <div class="col-lg-10 col-lg-offset-2">

                                        <dx:ASPxButton ID="btnRegistrar" runat="server" Text="Crear Cuenta" Width="100%"
                                            OnClick="btnAceptar_Click" CssClass="LoginButton" EnableTheming="False" Font-Bold="True" AutoPostBack="False" CausesValidation="False" UseSubmitBehavior="False">
                                        </dx:ASPxButton>
                                    </div>
                                </div>


                            </fieldset>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center">
                    <img src="Content/Images/ads.jpg" height="360px" width="200px" alt="" />
                </div>
            </div>
        </form>
    </div>
    <%--    </div>--%>
    <%--</form>--%>
</body>
</html>
