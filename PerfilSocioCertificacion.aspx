<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilSocioCertificacion.aspx.cs" Inherits="Connecting.Web.PerfilSocioCertificacion" %>
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

        .DisplayNone {
            display: none;
        }
    </style>

    <script type="text/javascript">

        function OnTabOperaOtroPaisInit(s, e) {
            s.SetActiveTabIndex(rblOperaOtroEmpresaPais.GetSelectedIndex());
        }

        function OnOperaOtroPaisChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            tlgOperaOtroPais.SetActiveTabIndex(selectedIndex);
        }

        function OnTabCorporacionInit(s, e) {
            s.SetActiveTabIndex(rblCorporacion.GetSelectedIndex());
        }

        function OnCorporacionChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            tlgCorporacion.SetActiveTabIndex(selectedIndex);
        }

        function OnDisponibilidadChanged(s, e) {
            
            if (s.GetItem(e.index).text == "TODO LO ANTERIOR") {
                if (s.GetItem(e.index).selected)
                    s.SelectAll();
                else
                    s.UnselectAll();
            } else {
                var newIndices = new Array();                
                for (var i = 0; i < s.items.length; i++)
                    if (s.items[i].text == "TODO LO ANTERIOR")
                        newIndices.push(i);
                
                if (newIndices.length > 0)
                    s.UnselectIndices(newIndices);
            }
        }


    </script>

    <div class="contenido">
        <div style="float: left; width: 150px; height: 100%">
            <dx:ASPxTabControl ID="tabPerfiles" runat="server" ActiveTabIndex="1" EnableTheming="True" Theme="Material" TabPosition="Left" Height="100%">
                <Tabs>
                    <dx:Tab Name="tabGenerales" Text="Generales" NavigateUrl="~/PerfilSocioGenerales.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabContactos" Text="Contactos" NavigateUrl="~/PerfilSocioContactos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabExportacion" Text="Exportación" NavigateUrl="~/PerfilSocioExportacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabMercado" Text="Mercado" NavigateUrl="~/PerfilSocioMercado.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabCertificacion" Text="Certificación" NavigateUrl="~/PerfilSocioCertificacion.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabComprador" Text="Comprador" NavigateUrl="~/PerfilSocioComprador.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabAdjuntos" Text="Adjuntos" NavigateUrl="~/PerfilSocioAdjuntos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                    <dx:Tab Name="tabProductos" Text="Productos" NavigateUrl="~/PerfilSocioProductos.aspx">
                        <ActiveTabStyle BackColor="#FFFFCC"></ActiveTabStyle>
                    </dx:Tab>
                </Tabs>
            </dx:ASPxTabControl>
        </div>

        <div style="float: left; width: 85%; overflow: auto">
            <dx:ASPxFormLayout ID="flyPerfilSocio" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                AlignItemCaptionsInAllGroups="True" Theme="Moderno" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="None" UseDefaultPaddings="False" ColCount="2">
                        <Items>
                            <dx:LayoutItem Caption="Avance" ShowCaption="False" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="clear: both">
                                            <dx:ASPxLabel ID="lblHeader" runat="server" Text="Perfil de Socio" Theme="Moderno" CssClass="header">
                                            </dx:ASPxLabel>
                                        </div>
                                        <div style="float: left">
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 5 de 7 - Datos de Certificación de la Empresa" CssClass="headerStep">
                                            </dx:ASPxLabel>
                                        </div>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Avance" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxProgressBar ID="pbAvance" runat="server" CustomDisplayFormat="" Maximum="7" Minimum="0" Theme="Material"
                                            Width="100px" DisplayFormatString="0">
                                        </dx:ASPxProgressBar>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption=""
                        GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Left" ShowCaption="False" HorizontalAlign="Left" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="Información acerca de certificaciones" RequiredMarkDisplayMode="Required" ShowCaption="True">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="gridCertificacion" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioCertificacion" Theme="Moderno" OnCellEditorInitialize="gridCertificacion_CellEditorInitialize"
                                            OnRowDeleting="gridCertificacion_RowDeleting" OnRowInserting="gridCertificacion_RowInserting" OnRowUpdating="gridCertificacion_RowUpdating" OnAfterPerformCallback="gridCertificacion_AfterPerformCallback">
                                            <SettingsCommandButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <NewButton Text="Nuevo" RenderMode="Button">
                                                    <Image Url="~/IMG/Nuevo.png"></Image>
                                                </NewButton>
                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                <EditButton Text="Editar" RenderMode="Button">
                                                    <Image Url="~/IMG/Editar.png"></Image>
                                                </EditButton>
                                                <DeleteButton Text="Borrar" RenderMode="Button">
                                                    <Image Url="~/IMG/Borrar.png"></Image>
                                                </DeleteButton>
                                                <ClearFilterButton>
                                                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                </ClearFilterButton>
                                            </SettingsCommandButton>
                                            <Columns>
                                                <dx:GridViewDataBinaryImageColumn FieldName="ImagenCertificacion" VisibleIndex="1" Caption="Imagen">
                                                    <PropertiesBinaryImage ImageHeight="140px" ImageWidth="140px" NullDisplayText="No disponible">
                                                        <EditingSettings Enabled="true" UploadSettings-UploadValidationSettings-MaxFileSize="1048576" EmptyValueText="Imagen">
                                                            <UploadSettings>
                                                                <UploadValidationSettings MaxFileSize="1048576"></UploadValidationSettings>
                                                            </UploadSettings>
                                                        </EditingSettings>
                                                    </PropertiesBinaryImage>
                                                </dx:GridViewDataBinaryImageColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="Nombre" FieldName="NombreCertificacion" Name="Certificacion" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <PropertiesComboBox TextField="NombreCertificacion" ValueField="IdCertificacion" ValueType="System.Int32"></PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="Observación" FieldName="ProductoCertificado" Name="ProductoCertificado" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="4" ButtonRenderMode="Image" Width="80px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Path Imagen" FieldName="PathImagen" Name="PathImagen" ShowInCustomizationForm="False"
                                                    VisibleIndex="0" Width="80px"  ReadOnly="True">
                                                    <HeaderStyle CssClass="DisplayNone" />
                                                    <CellStyle CssClass="DisplayNone"></CellStyle>
                                                    <EditFormSettings Visible="False" />
                                                    <EditFormCaptionStyle CssClass="DisplayNone"></EditFormCaptionStyle>
                                                    <PropertiesTextEdit Width="80px" NullText="0"><Style CssClass="DisplayNone"></Style></PropertiesTextEdit>                                                   
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager PageSize="1"></SettingsPager>
                                            <SettingsEditing UseFormLayout="True" Mode="PopupEditForm" NewItemRowPosition="Bottom" EditFormColumnCount="3"></SettingsEditing>
                                            <EditFormLayoutProperties ColCount="3">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="ImagenCertificacion" RowSpan="4" ShowCaption="False" HelpText="Tipos permitidos JPG, GIF o PNG. Tamaño máximo de archivo 1MB." Width="180px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Certificacion" ColSpan="2" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="ProductoCertificado" ColSpan="2" />
                                                    <dx:EditModeCommandLayoutItem ShowCancelButton="true" ShowUpdateButton="true" HorizontalAlign="Right" />
                                                </Items>
                                                <SettingsItemCaptions Location="Top"></SettingsItemCaptions>
                                            </EditFormLayoutProperties>

                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption=""
                        GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Left" ShowCaption="False" HorizontalAlign="Left" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="¿La empresa cuenta con premios o reconocimientos?" RequiredMarkDisplayMode="Required" ShowCaption="True">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="gridPremios" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioPremio" Theme="Moderno"
                                            OnRowDeleting="gridPremios_RowDeleting" OnRowInserting="gridPremios_RowInserting" OnRowUpdating="gridPremios_RowUpdating"
                                            OnAfterPerformCallback="gridPremios_AfterPerformCallback">
                                            <SettingsCommandButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <NewButton  Text="Nuevo" RenderMode="Button">
                                                    <Image Url="~/IMG/Nuevo.png"></Image>
                                                </NewButton>
                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                <EditButton Text="Editar" RenderMode="Button">
                                                    <Image Url="~/IMG/Editar.png"></Image>
                                                </EditButton>
                                                <DeleteButton Text="Borrar" RenderMode="Button">
                                                    <Image Url="~/IMG/Borrar.png"></Image>
                                                </DeleteButton>
                                                <ClearFilterButton>
                                                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                </ClearFilterButton>
                                            </SettingsCommandButton>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="2" ButtonRenderMode="Image" Width="80px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Premio" FieldName="NombrePremio" Name="NombrePremio" ShowInCustomizationForm="True" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Institución que lo otorga" FieldName="InstitucionOtorga" Name="InstitucionOtorga" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1" >
                                            </SettingsEditing>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption=""
                        GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Left" ShowCaption="False" HorizontalAlign="Left">
                        <Items>
                            <dx:LayoutItem Caption="Disponibilidad para a adecuación de productos" RequiredMarkDisplayMode="Required" ShowCaption="True" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxCheckBoxList ID="lstDisponibilidad" runat="server" Width="100%" RepeatColumns="3" ClientInstanceName="lstDisponibilidad"
                                            TextField="NombreDisponibilidad" ValueField="IdDisponibilidad" Theme="Moderno" ValueType="System.Int32">
                                            <Items>
                                            </Items>
                                            <ClientSideEvents SelectedIndexChanged="OnDisponibilidadChanged"></ClientSideEvents>
                                        </dx:ASPxCheckBoxList>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Otros, describa" RequiredMarkDisplayMode="Required" ShowCaption="True" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox ID="txtDisponibilidadOtros" runat="server" Width="100%" Theme="Moderno">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Left"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption=""
                        GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Left" ShowCaption="False" Width="100%" HorizontalAlign="Left">
                        <Items>
                            <dx:LayoutItem Caption="Indique cuáles han sido las innovaciones más recientes de la empresa" RequiredMarkDisplayMode="Required" ShowCaption="True">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="gridInnovacion" runat="server" Width="100%" AutoGenerateColumns="False" Theme="Moderno"
                                            KeyFieldName="IdSocio;IdInnovacion" OnRowUpdating="gridInnovacion_RowUpdating" OnAfterPerformCallback="gridInnovacion_AfterPerformCallback">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="2" ButtonRenderMode="Image" Width="120px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreInnovacion" Name="NombreInnovacion" ShowInCustomizationForm="True" VisibleIndex="0" ReadOnly="True" Width="300px">
                                                    <PropertiesTextEdit>
                                                        <Style BackColor="LightYellow">
                                                        </Style>
                                                    </PropertiesTextEdit>
                                                    <EditCellStyle BackColor="LightYellow">
                                                    </EditCellStyle>
                                                    <CellStyle BackColor="LightYellow">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" Name="DescripcionInnovacion" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsEditing Mode="Inline"  EditFormColumnCount="1">
                                            </SettingsEditing>
                                            <SettingsCommandButton>
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <NewButton Text="Nuevo" RenderMode="Button"><Image Url="~/IMG/Nuevo.png"></Image></NewButton>
                                                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                <EditButton Text="Editar" RenderMode="Button"><Image Url="~/IMG/Editar.png"></Image></EditButton>
                                                <DeleteButton Text="Borrar" RenderMode="Button"><Image Url="~/IMG/Borrar.png"></Image></DeleteButton>
                                                <ClearFilterButton><Image Url="~/IMG/LimpiarBusqueda.png"></Image></ClearFilterButton>
                                            </SettingsCommandButton>
                                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="float: left; display: inline">
                                            <dx:ASPxButton ID="btnAnterior" runat="server" Text="Anterior" Theme="Material" OnClick="btnAnterior_OnClick">
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Siguiente" Theme="Moderno" OnClick="btnSiguiente_OnClick">
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
        PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div style="clear: both">
                    <dx:ASPxMemo ID="txtMensaje" runat="server" Height="150px" Theme="Moderno" Width="100%">
                        <Border BorderStyle="None" />
                    </dx:ASPxMemo>
                </div>
                <div style="width: 120px; margin: 0 auto;">
                    <dx:ASPxButton ID="btnAceptarMsg" runat="server" Text="Aceptar" Theme="Moderno">
                        <ClientSideEvents Click="function(s, e) {popMensajes.Hide(); }"></ClientSideEvents>
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
