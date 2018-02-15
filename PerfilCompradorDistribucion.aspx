<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorDistribucion.aspx.cs" Inherits="Connecting.Web.PerfilCompradorDistribucion" meta:resourcekey="PageResource1" %>

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

    <script type="text/javascript">

        function OnMostrarGridImportador(s, e) {
            if (s.GetValue() == "I") {
                gridFormaImportar.SetVisible(true);
            }
            else {
                gridFormaImportar.SetVisible(false);
            }
        }

    </script>

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
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 4 de 7 - Datos de Importación" CssClass="headerStep" meta:resourcekey="lblHeaderStepResource1">
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
                            <%--                            <dx:LayoutItem ColSpan="3" ShowCaption="False" meta:resourcekey="LayoutItemResource4">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource4">
                                        <dx:ASPxMenu ID="mnuHeaderTools" runat="server" BackColor="White" EnableAdaptivity="True" ItemLinkMode="TextAndImage" SkinID="None" meta:resourcekey="mnuHeaderToolsResource1">
                                            <Items>
                                                <dx:MenuItem Name="itemNota" NavigateUrl="javascript:void(0)" Text="Crear Nota" meta:resourcekey="MenuItemResource1">
                                                    <Image Url="~/IMG/Nota.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemAutorizar" NavigateUrl="javascript:MostrarPopAprobacion()" Text="Autorizar Expediente" meta:resourcekey="MenuItemResource2">
                                                    <Image Url="~/IMG/Autorizar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                                <dx:MenuItem Name="itemRegresar" NavigateUrl="FormCompradorLista.aspx" Text="Regresar" meta:resourcekey="MenuItemResource3">
                                                    <Image Url="~/IMG/Regresar.png">
                                                    </Image>
                                                </dx:MenuItem>
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxMenu>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>--%>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="True" GroupBoxDecoration="None" meta:resourcekey="LayoutGroupResource2">
                        <Items>
                            <dx:LayoutItem Caption="Centros de distribución y tiendas" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Número de Tiendas y Centros de Distribución:" meta:resourcekey="LayoutItemResource6">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource6">
                                        <dx:ASPxTextBox ID="txtNumeroTiendas" runat="server" Theme="Moderno" Width="100%" meta:resourcekey="txtNumeroTiendasResource1"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Ubicación:" ShowCaption="False" meta:resourcekey="LayoutItemResource7">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource7">
                                        <dx:ASPxGridView ID="gridCentrosDistribucion" ClientInstanceName="gridCentrosDistribucion" Theme="Moderno" runat="server" KeyFieldName="IdDistribucion" AutoGenerateColumns="False" OnRowDeleting="gridCentrosDistribucion_RowDeleting" OnRowInserting="gridCentrosDistribucion_RowInserting" OnRowUpdating="gridCentrosDistribucion_RowUpdating" Width="100%" meta:resourcekey="gridCentrosDistribucionResource1">
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsText Title="Distribución" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Distribución" GroupPanel="Distribución"
                                                PopupEditFormCaption="Distribución" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Image" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="5" Width="40px" meta:resourcekey="GridViewCommandColumnResource1">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="IdDistribucion" Width="1px" meta:resourcekey="GridViewDataTextColumnResource1">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormSettings Visible="False" />
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ubicación" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="Ubicacion" meta:resourcekey="GridViewDataTextColumnResource2">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valUbicacion">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Codigo Comprador" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False" FieldName="IdComprador" meta:resourcekey="GridViewDataTextColumnResource3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="120px" meta:resourcekey="GridViewCommandColumnResource2">
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsCommandButton>
                                                <NewButton RenderMode="Button">
                                                    <Image Url="~/IMG/Nuevo.png">
                                                    </Image>
                                                </NewButton>
                                                <EditButton RenderMode="Button">
                                                    <Image Url="~/IMG/Editar.png">
                                                    </Image>
                                                </EditButton>
                                                <DeleteButton RenderMode="Button">
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
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                            <SettingsText Title="Distribución" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Left"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" GroupBoxDecoration="None" ShowCaption="False" meta:resourcekey="LayoutGroupResource3">
                        <Items>
                            <dx:LayoutItem Caption="Importa de forma directa o a traves de un distribuidor?" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource8">
                                        <dx:ASPxRadioButtonList ID="rblFormaImmportacion" Theme="Moderno" RepeatColumns="2" runat="server" ValueType="System.String" TextAlign="Left" SelectedIndex="0" Width="100%" meta:resourcekey="rblFormaImmportacionResource1">
                                            <Items>
                                                <dx:ListEditItem Text="Directo" Value="D" Selected="True" meta:resourcekey="ListEditItemResource1" />
                                                <dx:ListEditItem Text="Por medio de importador" Value="I" meta:resourcekey="ListEditItemResource2" />
                                            </Items>
                                            <ClientSideEvents SelectedIndexChanged="OnMostrarGridImportador"></ClientSideEvents>
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Left" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Información de los Importadores" ShowCaption="True" meta:resourcekey="LayoutItemResource9">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource9">
                                        <dx:ASPxGridView ID="gridFormaImportar" Theme="Moderno" ClientInstanceName="gridFormaImportar" KeyFieldName="IdCompradorDistribuidor" runat="server" AutoGenerateColumns="False"
                                            OnRowDeleting="gridFormaImportar_RowDeleting" OnRowInserting="gridFormaImportar_RowInserting" OnRowUpdating="gridFormaImportar_RowUpdating" Width="100%" meta:resourcekey="gridFormaImportarResource1" ClientVisible="False">
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsText Title="Importar" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Importar" GroupPanel="Importar"
                                                PopupEditFormCaption="Importar" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Image" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="5" Width="40px" meta:resourcekey="GridViewCommandColumnResource3">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="IdCompradorDistribuidor" Width="1px" meta:resourcekey="GridViewDataTextColumnResource4">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormSettings Visible="False" />
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Id Comprador" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" FieldName="IdComprador" meta:resourcekey="GridViewDataTextColumnResource5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="120px" meta:resourcekey="GridViewCommandColumnResource4">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Telefono" FieldName="Telefono" Name="Telefono" ShowInCustomizationForm="True" VisibleIndex="3" meta:resourcekey="GridViewDataTextColumnResource6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="Email" ShowInCustomizationForm="True" VisibleIndex="4" meta:resourcekey="GridViewDataTextColumnResource7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreDistribuidor" Name="NombreDistribuidor" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource8">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valDistribuidor">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="400px" />
                                            </SettingsPopup>
                                            <SettingsCommandButton>
                                                <NewButton RenderMode="Button">
                                                    <Image Url="~/IMG/Nuevo.png"></Image>
                                                </NewButton>
                                                <EditButton RenderMode="Button">
                                                    <Image Url="~/IMG/Editar.png"></Image>
                                                </EditButton>
                                                <DeleteButton RenderMode="Button">
                                                    <Image Url="~/IMG/Borrar.png"></Image>
                                                </DeleteButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <ClearFilterButton>
                                                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                </ClearFilterButton>
                                                <UpdateButton Text="Aceptar" RenderMode="Button"></UpdateButton>
                                                <CancelButton Text="Cancelar" RenderMode="Button"></CancelButton>
                                            </SettingsCommandButton>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                            <SettingsText Title="Importadores" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Left"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine" meta:resourcekey="LayoutGroupResource4">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource10">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource10">
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
