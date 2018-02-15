<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilCompradorContactos.aspx.cs" Inherits="Connecting.Web.PerfilCompradorContactos" meta:resourcekey="PageResource1" %>
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
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 2 de 7 - Datos del Contacto" CssClass="headerStep" meta:resourcekey="lblHeaderStepResource1">
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

                    <dx:LayoutGroup Caption="" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False" meta:resourcekey="LayoutGroupResource2">
                        <Items>
                            <dx:LayoutItem Caption="" meta:resourcekey="LayoutItemResource5">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer meta:resourcekey="LayoutItemNestedControlContainerResource5">
                                        <dx:ASPxGridView ID="gridContacto" KeyFieldName="IdContacto" ClientInstanceName="gridContacto"
                                            runat="server" AutoGenerateColumns="False" OnRowDeleting="gridContacto_RowDeleting" OnRowInserting="gridContacto_RowInserting"
                                            OnRowUpdating="gridContacto_RowUpdating" Width="100%" Theme="Moderno" meta:resourcekey="gridContactoResource1" OnAfterPerformCallback="gridContacto_AfterPerformCallback">
                                            <%--<Settings ColumnMinWidth="100" HorizontalScrollBarMode="Auto" />--%>
                                            <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1"></SettingsEditing>
                                            <SettingsEditing UseFormLayout="True" Mode="PopupEditForm" EditFormColumnCount="3"></SettingsEditing>
                                            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                            <SettingsText Title="Contacto" CommandCancel="Cancelar" CommandClearFilter="Limpiar Filtro"
                                                CommandDelete="Borrar" CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Guardar"
                                                ConfirmDelete="Desea borrar el registro." EmptyHeaders="Contacto" GroupPanel="Contacto"
                                                PopupEditFormCaption="Formulario" EmptyDataRow="No hay registros."></SettingsText>
                                            <SettingsPager PageSize="4"></SettingsPager>
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                            <SettingsBehavior ConfirmDelete="True" />
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

                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="700px" VerticalAlign="Middle"  HorizontalAlign="WindowCenter"/>
                                            </SettingsPopup>
                                            <SettingsText Title="Contacto" />
                                            <EditFormLayoutProperties ColCount="3" >
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="Tarjeta" RowSpan="7" ShowCaption="False" HelpText="Tipos permitidos JPG, GIF o PNG. Tamaño máximo de archivo 10MB." Width="160px" meta:resourcekey="GridViewColumnLayoutItemResource1" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="IdTipoContacto" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource2" HelpText="Marque la casilla si el contacto actual es el principal dentro de su organización" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Nombre" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource3" HelpText="Marque la casilla si el contacto actual es el principal dentro de su organización" Width="500px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Puesto" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource4" Width="500px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Correo" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource5" Width="500px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Telefono" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource6" Width="300px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="UsuarioSkype" ColSpan="2" meta:resourcekey="GridViewColumnLayoutItemResource7" Width="500px" />
                                                    <dx:EditModeCommandLayoutItem ShowCancelButton="true" ShowUpdateButton="true" HorizontalAlign="Right" meta:resourcekey="EditModeCommandLayoutItemResource1" />
                                                </Items>
                                            </EditFormLayoutProperties>

                                            <Columns>
                                                <dx:GridViewCommandColumn ButtonType="Image" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="7" Width="120px" >
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataCheckColumn Caption="Principal" FieldName="IdTipoContacto" Name="IdTipoContacto" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px" meta:resourcekey="GridViewDataCheckColumnResource1">
                                                    <PropertiesCheckEdit ValueChecked="P" ValueType="System.String" ValueUnchecked="S">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2" Name="Nombre" meta:resourcekey="GridViewDataTextColumnResource1" Width="300px">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valContacto" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Puesto" FieldName="Puesto" ShowInCustomizationForm="True" VisibleIndex="3" Name="Puesto" meta:resourcekey="GridViewDataTextColumnResource2">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" ValidationGroup="valContacto" SetFocusOnError="True">
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Telefono" FieldName="Telefono" ShowInCustomizationForm="True" VisibleIndex="4" Name="Telefono" meta:resourcekey="GridViewDataTextColumnResource3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Email" FieldName="Correo" ShowInCustomizationForm="True" VisibleIndex="5" Name="Correo" meta:resourcekey="GridViewDataTextColumnResource4">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True" ValidationGroup="valContacto">
                                                            <RegularExpression ErrorText="Correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Usuario Skype" FieldName="UsuarioSkype" ShowInCustomizationForm="True" VisibleIndex="6" Name="UsuarioSkype" meta:resourcekey="GridViewDataTextColumnResource5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataBinaryImageColumn FieldName="Tarjeta" VisibleIndex="0" meta:resourcekey="GridViewDataBinaryImageColumnResource1">
                                                    <PropertiesBinaryImage ImageHeight="140px" ImageWidth="140px" NullDisplayText="No disponible" ToolTip="Seleccione la imagen que corresponde a la tarjeta de presentación del socio actual">
                                                     <%--   <EmptyImage Height="60px" Url="~/IMG/NoDisponible.jpg" Width="60px">
                                                        </EmptyImage>--%>
                                                        <EditingSettings Enabled="true" UploadSettings-UploadValidationSettings-MaxFileSize="4194304" EmptyValueText="Tarjeta">
                                                            <UploadSettings>
                                                                <UploadValidationSettings MaxFileSize="10485760"></UploadValidationSettings>
                                                            </UploadSettings>
                                                        </EditingSettings>
                                                    </PropertiesBinaryImage>
                                                </dx:GridViewDataBinaryImageColumn>
                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="120px">
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                            <Styles>
                                                <AlternatingRow BackColor="#E9E9E9">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine" meta:resourcekey="LayoutGroupResource3">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left" meta:resourcekey="LayoutItemResource8">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" meta:resourcekey="LayoutItemNestedControlContainerResource6">
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
