<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilSocioAdjuntos.aspx.cs" Inherits="Connecting.Web.PerfilSocioAdjuntos" %>

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
    </style>

    <script type="text/javascript">
        function OnDocAdjuntoUploadComplete(s, e) {
            if (e.callbackData !== "") {
                lblNombreDocAdjunto.SetText(e.callbackData);
            }
        }

        function OnBorrarDocAdjuntoClick(s, e) {
            callback.PerformCallback(lblNombreDocAdjunto.GetText());
        }

        function OnCallbackComplete(s, e) {
            if (e.result === "ok") {
                lblNombreDocAdjunto.SetText(null);
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
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 1 de 7 - Archivos Adjuntos" CssClass="headerStep">
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
                    <dx:LayoutGroup Caption="" GroupBoxDecoration="HeadingLine" ShowCaption="False" Width="100%">
                        <Items>
                            <dx:LayoutItem Caption="A continuación se le presenta una lista de documentos que debe adjuntar para generar el perfíl de su empresa"
                                RequiredMarkDisplayMode="Hidden">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <ul>
                                            <li>IMÁGENES DE LA EMPRESA: elija imágenes que le den una idea clara al comprador de su empresa.</li>
                                            <li>IMÁGENES DE LOS PRODUCTOS: de todas las líneas de producto, idealmente un catálogo.</li>
                                            <li>PRESENTACIÓN O CV DE LA EMPRESA</li>
                                            <li>BROCHURES EN FORMATO PDF</li>
                                        </ul>
                                        <br />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="" RequiredMarkDisplayMode="Hidden" ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxGridView ID="gridDocumentosAdjuntos" runat="server" Width="100%" AutoGenerateColumns="False" Theme="Moderno"
                                            OnAfterPerformCallback="gridDocumentosAdjuntos_AfterPerformCallback" OnCancelRowEditing="gridDocumentosAdjuntos_OnCancelRowEditing"
                                            OnRowDeleting="gridDocumentosAdjuntos_RowDeleting" OnRowInserting="gridDocumentosAdjuntos_RowInserting"
                                            OnRowUpdating="gridDocumentosAdjuntos_RowUpdating" KeyFieldName="IdSocioDocumento">
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
                                            </SettingsEditing>
                                            <SettingsBehavior ConfirmDelete="True" />
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
                                            <SettingsPopup>
                                                <EditForm Modal="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowDeleteButton="False" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="3"
                                                    ButtonRenderMode="Image" Width="40px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewCommandColumn ButtonType="Image" Caption="#" ShowDeleteButton="True" VisibleIndex="4" Width="120px">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" Name="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ubicacion" UnboundType="Object" VisibleIndex="2" Width="250px">
                                                    <DataItemTemplate>
                                                        <dx:ASPxHyperLink ID="hlkDocAdjunto" OnLoad="hlkDocAdjunto_Load" runat="server" Target="_blank" Text="No hay documento">
                                                        </dx:ASPxHyperLink>
                                                    </DataItemTemplate>
                                                    <EditItemTemplate>
                                                        <dx:ASPxLabel ID="lblMaxFileSize" runat="server" Text="Tamaño máximo de archivo: 1Mb" Font-Size="8pt" />
                                                        <br />
                                                        <dx:ASPxUploadControl ID="uplDocAjdunto" ShowProgressPanel="true" UploadMode="Auto" AutoStartUpload="true" FileUploadMode="OnPageLoad"
                                                            OnFileUploadComplete="uplDocAdjunto_FileUploadComplete" runat="server">
                                                            <ValidationSettings MaxFileSize="1048576" MaxFileSizeErrorText="El tamaño del archivo ha superado el limite permitido" AllowedFileExtensions=".*">
                                                            </ValidationSettings>
                                                            <ClientSideEvents FileUploadComplete="OnDocAdjuntoUploadComplete" />
                                                        </dx:ASPxUploadControl>
                                                        <br />
                                                        <dx:ASPxLabel ID="lblNombreDocAdjunto" runat="server" ClientInstanceName="lblNombreDocAdjunto" Font-Size="8pt" Font-Bold="True" />
                                                    </EditItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="" RequiredMarkDisplayMode="Auto" ShowCaption="False" Width="100%">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxLabel ID="lblFormulariosIncompletos" ForeColor="red" runat="server" Text="NOTA: LOS FORMULARIOS INCOMPLETOS O QUE NO PRESENTEN LOS DOCUMENTOS ANTES DESCRITOS, NO SERÁN PROCESADOS." Theme="Moderno"></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="Confidencialidad de documentos" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right">
                        <Items>
                            <dx:LayoutItem Caption="" RequiredMarkDisplayMode="Hidden" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>

                                        <dx:ASPxLabel ID="lblConfidencialidadDoctos" runat="server" Theme="Moderno"
                                            Text="La información presentada en este formulario es de carácter confidencial y solo será utilizada por la Unidad de Gestión y Monitoreo de Negocios de AGEXPORT con el propósito exclusivo de promover las negociaciones entre su empresa y la demanda internacional. La base de datos no será compartida con terceros o utilizada en campañas de correo masivo. Ambas partes se comprometen a no hacer mal uso de la información, a no divulgar la misma y a que el contenido del formulario sea verídico y comprobable." Font-Bold="False">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" Location="Top"></SettingsItemCaptions>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="" ShowCaption="False" GroupBoxDecoration="HeadingLine">
                        <Items>
                            <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <div style="float: left; display: inline">
                                            <dx:ASPxButton ID="btnAnterior" runat="server" Text="Anterior" Theme="Moderno" OnClick="btnAnterior_OnClick">
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="btnSiguiente" runat="server" Text="Finalizar" Theme="Moderno" OnClick="btnSiguiente_OnClick">
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
