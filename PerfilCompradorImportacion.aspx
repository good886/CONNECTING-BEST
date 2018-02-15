<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorImportacion.aspx.cs" Inherits="Connecting.Web.PerfilCompradorImportacion" meta:resourcekey="PageResource1" %>
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
        function OnMostrarGrid(s, e) {
            if (s.GetValue() == "S") {
                gridImportacion.SetVisible(true);
            }

            else {
                gridImportacion.SetVisible(false);
            }
        }

        function OnMostrarGridCA(s, e) {
            if (s.GetValue() == "S") {
                gridImportacionCA.SetVisible(true);
            }

            else {
                gridImportacionCA.SetVisible(false);
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
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 3 de 7 - Datos de Importación" CssClass="headerStep" meta:resourcekey="lblHeaderStepResource1">
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

                    <dx:LayoutGroup Caption="" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False" meta:resourcekey="LayoutGroupResource2">
                        <Items>
                            <dx:LayoutItem Caption="¿Su empresa importa productos de Guatemala?" ShowCaption="True" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                        <dx:ASPxRadioButtonList ID="rdbImportaProductos" Theme="Moderno" RepeatColumns="2" runat="server" ValueType="System.String" TextAlign="Left" SelectedIndex="0" meta:resourcekey="rdbImportaProductosResource1">
                                            <Items>
                                                <dx:ListEditItem Text="Si" Value="S" Selected="True" meta:resourcekey="ListEditItemResource1" />
                                                <dx:ListEditItem Text="No" Value="N" meta:resourcekey="ListEditItemResource2" />
                                            </Items>
                                            <ClientSideEvents SelectedIndexChanged="OnMostrarGrid"></ClientSideEvents>
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Left" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="" ShowCaption="False" meta:resourcekey="LayoutItemResource6">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource6">
                                        <dx:ASPxGridView ID="gridImportacion" ClientInstanceName="gridImportacion" Theme="Moderno" runat="server" KeyFieldName="IdImportacion" AutoGenerateColumns="False" Width="100%"
                                            OnRowDeleting="gridImportacion_RowDeleting"
                                            OnRowInserting="gridImportacion_RowInserting"
                                            OnRowUpdating="gridImportacion_RowUpdating"
                                            OnCellEditorInitialize="gridImportacion_CellEditorInitialize" meta:resourcekey="gridImportacionResource1">
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsText Title="Importación" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Importación" GroupPanel="Importación"
                                                PopupEditFormCaption="Importación" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Image" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="9" Width="40px" meta:resourcekey="GridViewCommandColumnResource1">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="IdImportacion" meta:resourcekey="GridViewDataTextColumnResource1">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormSettings Visible="False" />
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="Cantidad" Width="120px" meta:resourcekey="GridViewDataTextColumnResource2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="3" FieldName="Frecuencia" Width="120px" meta:resourcekey="GridViewDataTextColumnResource3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Comprador" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False" FieldName="IdComprador" meta:resourcekey="GridViewDataTextColumnResource4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px" meta:resourcekey="GridViewDataTextColumnResource5">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valImportarG">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Proveedor" Name="Proveedor" ShowInCustomizationForm="True" VisibleIndex="0" meta:resourcekey="GridViewDataTextColumnResource6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="10" Width="40px" meta:resourcekey="GridViewCommandColumnResource2">
                                                </dx:GridViewCommandColumn>
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
                                                <UpdateButton Text="Aceptar" RenderMode="Button">
                                                </UpdateButton>
                                                <CancelButton Text="Cancelar" RenderMode="Button">
                                                </CancelButton>
                                            </SettingsCommandButton>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                            <SettingsText Title="Importación" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Left" ShowCaption="False" meta:resourcekey="LayoutGroupResource3">
                        <Items>
                            <dx:LayoutItem Caption="Seleccione la actividad comercial que encaja con la de su empresa, puede escoger más de una opción" ShowCaption="True" meta:resourcekey="LayoutItemResource7">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource7">
                                        <dx:ASPxCheckBoxList ID="lstchkActividadComercial" runat="server" Width="100%" RepeatColumns="2"
                                            TextField="ActividadComercial" ValueField="IdActividadComercial" Theme="Moderno" AutoPostBack="false" ClientInstanceName="lstchkActividadComercial" meta:resourcekey="lstchkActividadComercialResource1">
                                            <Items>
                                            </Items>
                                        </dx:ASPxCheckBoxList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Top" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Otros:" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource8">
                                        <dx:ASPxTextBox ID="txtActividadComercialOtros" runat="server" Theme="Moderno" Width="100%" meta:resourcekey="txtActividadComercialOtrosResource1"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False" meta:resourcekey="LayoutGroupResource4">
                        <Items>
                            <dx:LayoutItem Caption="Importa productos de CentroAmerica?" ShowCaption="True" meta:resourcekey="LayoutItemResource9">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource9">
                                        <dx:ASPxRadioButtonList ID="rdbImportaProductosCA" Theme="Moderno" RepeatColumns="2" runat="server" ValueType="System.String" TextAlign="Left" SelectedIndex="0" meta:resourcekey="rdbImportaProductosCAResource1">

                                            <Items>
                                                <dx:ListEditItem Text="Si" Value="S" Selected="True" meta:resourcekey="ListEditItemResource3" />
                                                <dx:ListEditItem Text="No" Value="N" meta:resourcekey="ListEditItemResource4" />
                                            </Items>
                                            <ClientSideEvents SelectedIndexChanged="OnMostrarGridCA"></ClientSideEvents>
                                        </dx:ASPxRadioButtonList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Left" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="" ShowCaption="False" meta:resourcekey="LayoutItemResource10">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource10">
                                        <dx:ASPxGridView ID="gridImportacionCA" ClientInstanceName="gridImportacionCA" Theme="Moderno" runat="server" KeyFieldName="IdImportacion"
                                            AutoGenerateColumns="False" Width="100%"
                                            OnRowDeleting="gridImportacionCA_RowDeleting"
                                            OnRowInserting="gridImportacionCA_RowInserting"
                                            OnRowUpdating="gridImportacionCA_RowUpdating"
                                            OnCellEditorInitialize="gridImportacionCA_CellEditorInitialize" meta:resourcekey="gridImportacionCAResource1">

                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsText Title="Importación" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Importación" GroupPanel="Importación"
                                                PopupEditFormCaption="Importación" EmptyDataRow="No hay registros."></SettingsText>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ButtonType="Image" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="11" Width="120px" meta:resourcekey="GridViewCommandColumnResource3">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption=" Id" ShowInCustomizationForm="True" VisibleIndex="10" FieldName="IdImportacion" meta:resourcekey="GridViewDataTextColumnResource7">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormSettings Visible="False" />
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0">
                                                        <Style CssClass="DisplayNone"></Style>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Cantidad" Width="120px" meta:resourcekey="GridViewDataTextColumnResource8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="Frecuencia" Width="120px" meta:resourcekey="GridViewDataTextColumnResource9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Comprador" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False" FieldName="IdComprador" meta:resourcekey="GridViewDataTextColumnResource10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Pais" FieldName="NombrePais" ShowInCustomizationForm="True" VisibleIndex="1" Width="120px" meta:resourcekey="GridViewDataComboBoxColumnResource1">
                                                    <PropertiesComboBox TextField="NombrePais" ValueField="IdPais">
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valImportaC">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="3" Width="300px" meta:resourcekey="GridViewDataTextColumnResource11">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valImportaC">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Proveedor" Name="Proveedor" ShowInCustomizationForm="True" VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource12">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="12" Width="120px" meta:resourcekey="GridViewCommandColumnResource4">
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
                                            <SettingsText Title="Importación" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings HorizontalAlign="Left" Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine" meta:resourcekey="LayoutGroupResource5">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource11">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource11">
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
