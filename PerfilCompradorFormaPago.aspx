﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorFormaPago.aspx.cs" Inherits="Connecting.Web.PerfilCompradorFormaPago" meta:resourcekey="PageResource1" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .formLayoutContainer {
            width: 100%;
            /*margin: auto;*/
            padding: 0px;
            background: white;
        }

        .layoutGroupBoxCaption {
            font-size: 16px;
            font-weight: bold;
        }

        .header {
            font-size: 16px;
            font-weight: bold;
            color: black;
            /*font-family: sans-serif;*/
        }

        .headerStep {
            font-size: 14px;
            font-weight: bold;
            color: navy;
            /*font-family: sans-serif;*/
        }

        .customHeader {
            height: 48px;
        }

        .Estado {
            padding: 5px;
        }

        .DisplayNone {
            display: none;
        }
    </style>

    <div class="contenido">
        <div style="float: left; width: 150px; height: 100%">
            <dx:ASPxTabControl ID="tabPerfiles" runat="server" ActiveTabIndex="0" EnableTheming="True" Theme="Material" TabPosition="Left" Height="100%" meta:resourcekey="tabPerfilesResource1">
                <Tabs>
                    <dx:Tab Name="tabGenerales" Text="Generales" NavigateUrl="~/PerfilCompradorGenerales.aspx" meta:resourcekey="TabResource1">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabContactos" Text="Contactos" NavigateUrl="~/PerfilCompradorContactos.aspx" meta:resourcekey="TabResource2">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabImportacion" Text="Importación" NavigateUrl="~/PerfilCompradorImportacion.aspx" meta:resourcekey="TabResource3">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabDistribucion" Text="Distribución" NavigateUrl="~/PerfilCompradorDistribucion.aspx" meta:resourcekey="TabResource4">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabMercado" Text="Certificaciones" NavigateUrl="~/PerfilCompradorCertificacion.aspx" meta:resourcekey="TabResource5">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabCertificacion" Text="Forma de Pago" NavigateUrl="~/PerfilCompradorFormaPago.aspx" meta:resourcekey="TabResource6">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabComprador" Text="Ferias" NavigateUrl="~/PerfilCompradorFerias.aspx" meta:resourcekey="TabResource7">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabProductos" Text="Productos" NavigateUrl="~/PerfilCompradorProductos.aspx" meta:resourcekey="TabResource8">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                </Tabs>
            </dx:ASPxTabControl>
        </div>

        <div style="float: left; width: 85%; overflow: auto">
            <dx:ASPxFormLayout ID="flyPerfilComprador" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                AlignItemCaptionsInAllGroups="True" Theme="Moderno" Width="100%" meta:resourcekey="flyPerfilCompradorResource1">
                <Items>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="None" UseDefaultPaddings="False" ColCount="3" meta:resourcekey="LayoutGroupResource1">
                        <Items>
                            <dx:LayoutItem Caption="Avance" ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource1">
                                        <div style="clear: both">
                                            <dx:ASPxLabel ID="lblHeader" runat="server" Text="Perfil de Comprador" Theme="Moderno" CssClass="header" meta:resourcekey="lblHeaderResource1">
                                            </dx:ASPxLabel>
                                        </div>
                                        <div style="float: left">
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 6 de 7 - Formas de Pago" CssClass="headerStep" meta:resourcekey="lblHeaderStepResource1">
                                            </dx:ASPxLabel>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Avance" HorizontalAlign="Right" meta:resourcekey="LayoutItemResource2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource2">
                                        <dx:ASPxProgressBar ID="pbAvance" runat="server" CustomDisplayFormat="" Maximum="7" Minimum="0" Theme="Material"
                                            Width="100px" DisplayFormatString="0" meta:resourcekey="pbAvanceResource1">
                                        </dx:ASPxProgressBar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Estado" meta:resourcekey="LayoutItemResource3">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource3">
                                        <dx:ASPxLabel ID="lblEstadoSocio" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="White" CssClass="Estado" ClientInstanceName="lblEstadoSocio" meta:resourcekey="lblEstadoSocioResource1">
                                            <Border BorderStyle="Solid" BorderWidth="1px"></Border>
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" GroupBoxDecoration="HeadingLine" ShowCaption="False" meta:resourcekey="LayoutGroupResource2">
                        <Items>
                            <dx:LayoutItem Caption="Formas de pago a proveedores que su empresa utiliza" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* Haga clic en la casilla descripción para editar el registro" meta:resourcekey="LayoutItemResource6">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource6">
                                        <dx:ASPxGridView ID="gridFormaPago" Theme="Moderno" KeyFieldName="IdFormaPago" ClientInstanceName="gridFormaPago" runat="server"
                                            AutoGenerateColumns="False" Width="100%" OnRowUpdating="gridFormaPago_RowUpdating" meta:resourcekey="gridFormaPagoResource1">
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsText Title="Forma de Pago" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="Batch">
                                                <BatchEditSettings StartEditAction="Click" />
                                            </SettingsEditing>
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsCommandButton>
                                                <NewButton>
                                                    <Image Url="~/IMG/Nuevo.png">
                                                    </Image>
                                                </NewButton>
                                                <EditButton>
                                                    <Image Url="~/IMG/Editar.png">
                                                    </Image>
                                                </EditButton>
                                                <DeleteButton>
                                                    <Image Url="~/IMG/Borrar.png">
                                                    </Image>
                                                </DeleteButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <ClearFilterButton>
                                                    <Image Url="~/IMG/LimpiarBusqueda.png">
                                                    </Image>
                                                </ClearFilterButton>
                                                <UpdateButton Text="Aceptar" RenderMode="Button">
                                                </UpdateButton>
                                                <CancelButton Text="Cancelar" RenderMode="Button">
                                                </CancelButton>
                                            </SettingsCommandButton>
                                            <SettingsDataSecurity AllowInsert="False" />
                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsText Title="Forma Pago" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Forma Pago" GroupPanel="Forma Pago"
                                                PopupEditFormCaption="Forma Pago" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Forma Pago" ShowInCustomizationForm="True" VisibleIndex="6" FieldName="FormaPago" Width="200px" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="7" meta:resourcekey="GridViewDataTextColumnResource2">
                                                    <PropertiesTextEdit>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" FieldName="IdCompradorFormaPago" ShowInCustomizationForm="True" VisibleIndex="9" meta:resourcekey="GridViewDataTextColumnResource3">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="IdFormaPago" FieldName="IdFormaPago" Name="IdFormaPago" ShowInCustomizationForm="True" VisibleIndex="5" Width="40px" Visible="False" meta:resourcekey="GridViewDataTextColumnResource4">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle ForeColor="#999999">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="* Haga clic en la casilla descripción para editar el registro" meta:resourcekey="LayoutItemResource7">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource7">
                                        <dx:ASPxGridView ID="gridPlazoCredito" Theme="Moderno" KeyFieldName="IdPlazoCredito" ClientInstanceName="gridPlazoCredito" runat="server"
                                            AutoGenerateColumns="False" Width="100%" OnRowUpdating="gridPlazoCredito_RowUpdating" meta:resourcekey="gridPlazoCreditoResource1">
                                            <SettingsText Title="Plazo de Credito" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="Batch">
                                                <BatchEditSettings StartEditAction="Click" />
                                            </SettingsEditing>
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsCommandButton>
                                                <NewButton>
                                                    <Image Url="~/IMG/Nuevo.png">
                                                    </Image>
                                                </NewButton>
                                                <EditButton>
                                                    <Image Url="~/IMG/Editar.png">
                                                    </Image>
                                                </EditButton>
                                                <DeleteButton>
                                                    <Image Url="~/IMG/Borrar.png">
                                                    </Image>
                                                </DeleteButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <ClearFilterButton>
                                                    <Image Url="~/IMG/LimpiarBusqueda.png">
                                                    </Image>
                                                </ClearFilterButton>
                                                <UpdateButton Text="Aceptar" RenderMode="Button">
                                                </UpdateButton>
                                                <CancelButton Text="Cancelar" RenderMode="Button">
                                                </CancelButton>
                                            </SettingsCommandButton>
                                            <SettingsDataSecurity AllowInsert="False" AllowDelete="False" />
                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsText Title="Plazo Credito" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Plazo Credito" GroupPanel="Plazo Credito"
                                                PopupEditFormCaption="Plazo Credito" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption=" IdPlazoCredito" ShowInCustomizationForm="True" VisibleIndex="0" FieldName="IdPlazoCredito" Width="40px" Visible="False" meta:resourcekey="GridViewDataTextColumnResource5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Plazo Credito" ShowInCustomizationForm="True" VisibleIndex="6" FieldName="PlazoCredito" Width="200px" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="7" meta:resourcekey="GridViewDataTextColumnResource7">
                                                    <PropertiesTextEdit>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" FieldName="IdCompradorPlazoCredito" ShowInCustomizationForm="True" VisibleIndex="9" meta:resourcekey="GridViewDataTextColumnResource8">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <%--<EditFormSettings Visible="False" />--%>
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle ForeColor="#999999">
                                </CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Otros:" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource8">
                                        <dx:ASPxMemo ID="txtOtrosFormaPago" runat="server" Height="100px" Width="100%" meta:resourcekey="txtOtrosFormaPagoResource1" Theme="Moderno"></dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>

                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine" meta:resourcekey="LayoutGroupResource3">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource9">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource9">
                                        <div style="float: left; display: inline">
                                            <dx:ASPxButton ID="btnAnterior" runat="server" Text="Anterior" Theme="Material" OnClick="btnAnterior_OnClick" meta:resourcekey="btnAnteriorResource1">
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Siguiente" Theme="Moderno" OnClick="btnSiguiente_Click" meta:resourcekey="btnSiguienteResource1">
                                            </dx:ASPxButton>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                </Items>
                <Styles>
                    <LayoutGroupBox>
                        <Caption CssClass="layoutGroupBoxCaption"></Caption>
                    </LayoutGroupBox>
                </Styles>
            </dx:ASPxFormLayout>

        </div>
    </div>

    <dx:ASPxPopupControl ID="popMensajes" runat="server" CloseAction="CloseButton" HeaderText="Notificación de Mensajes"
        Modal="True" Theme="Moderno" Width="500px" ClientSideEvents="popMensajes" ClientInstanceName="popMensajes" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" meta:resourcekey="popMensajesResource1">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" meta:resourcekey="PopupControlContentControlResource1">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%" ClientInstanceName="txtMensaje" meta:resourcekey="txtMensajeResource1">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno" AutoPostBack="False" meta:resourcekey="btnAceptarMsgResource1">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide(); }"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
