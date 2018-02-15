<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilSocioContactos.aspx.cs" Inherits="Connecting.Web.PerfilSocioContactos" %>
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
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 2 de 7 - Contactos de la Empresa" CssClass="headerStep">
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

                    <dx:LayoutGroup Caption="Contactos" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False">
                        <Items>
                            <dx:LayoutItem Caption="">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="gridContactos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdContacto" Theme="Moderno" OnRowInserting="gridContactos_RowInserting" OnRowDeleting="gridContactos_RowDeleting"
                                            OnRowUpdating="gridContactos_RowUpdating" OnAfterPerformCallback="gridContactos_AfterPerformCallback" OnCustomErrorText="gridContactos_CustomErrorText">
                                            <Columns>
                                                <dx:GridViewDataBinaryImageColumn FieldName="Tarjeta" VisibleIndex="0">
                                                    <PropertiesBinaryImage ImageHeight="160px" ImageWidth="160px" NullDisplayText="No disponible" ToolTip="Seleccione la imagen que corresponde a la tarjeta de presentación del socio actual" ShowLoadingImage="True">
                                                        <%--                                                        <EmptyImage Height="60px" Url="~/IMG/NoDisponible.jpg" Width="60px">
                                                        </EmptyImage>--%>
                                                        <EditingSettings Enabled="true" UploadSettings-UploadValidationSettings-MaxFileSize="10485760" EmptyValueText="Tarjeta">
                                                            <UploadSettings>
                                                                <UploadValidationSettings MaxFileSize="10485760"></UploadValidationSettings>
                                                            </UploadSettings>
                                                        </EditingSettings>
                                                    </PropertiesBinaryImage>
                                                </dx:GridViewDataBinaryImageColumn>
                                                <dx:GridViewDataCheckColumn Caption="¿Principal?" FieldName="IdTipoContacto" Name="IdTipoContacto" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px">
                                                    <PropertiesCheckEdit ValueChecked="P" ValueType="System.String" ValueUnchecked="S">
                                                    </PropertiesCheckEdit>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" Name="Nombre" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                            <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Puesto" FieldName="Puesto" Name="Puesto" ShowInCustomizationForm="True" VisibleIndex="4" Width="150px">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Correo" FieldName="Correo" Name="Correo" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                            <RegularExpression ErrorText="Correo inválido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                            <RequiredField ErrorText="Valor Requerido" IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Teléfono" FieldName="Telefono" Name="Telefono" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="6" ShowNewButtonInHeader="True" Width="80px"></dx:GridViewCommandColumn>

                                            </Columns>
                                            <SettingsPager PageSize="4"></SettingsPager>
                                            <SettingsEditing UseFormLayout="True" Mode="PopupEditForm" EditFormColumnCount="3"></SettingsEditing>
                                            <SettingsPopup>
                                                <EditForm Modal="True" Width="700px" VerticalAlign="Middle" HorizontalAlign="WindowCenter" />
                                            </SettingsPopup>
                                            <EditFormLayoutProperties ColCount="3">
                                                <Items>
                                                    <dx:GridViewColumnLayoutItem ColumnName="Tarjeta" RowSpan="5" ShowCaption="False" HelpText="Tipos permitidos JPG, GIF o PNG. Tamaño máximo de archivo 10MB." Width="180px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="IdTipoContacto" ColSpan="2" HelpText="Marque la casilla si el contacto actual es el principal dentro de su organización" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Nombre" ColSpan="2" Width="500px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Telefono" ColSpan="2" Width="300px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Puesto" ColSpan="2" Width="500px" />
                                                    <dx:GridViewColumnLayoutItem ColumnName="Correo" ColSpan="2" Width="500px" />
                                                    <dx:EditModeCommandLayoutItem ShowCancelButton="true" ShowUpdateButton="true" HorizontalAlign="Right" />
                                                </Items>
                                            </EditFormLayoutProperties>
                                            <Settings ShowTitlePanel="True" />
                                            <SettingsCommandButton RenderMode="Button">
                                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                <NewButton Text="Nuevo" ButtonType="Button" RenderMode="Button">
                                                    <Image ToolTip="Crear un contacto" Url="~/IMG/Nuevo.png">
                                                    </Image>
                                                </NewButton>
                                                <UpdateButton Text="Aceptar"></UpdateButton>
                                                <CancelButton Text="Cancelar"></CancelButton>
                                                <EditButton Text="Editar" ButtonType="Button" RenderMode="Button">
                                                    <Image Url="~/IMG/Editar.png">
                                                    </Image>
                                                </EditButton>
                                                <DeleteButton Text="Borrar"></DeleteButton>
                                            </SettingsCommandButton>
                                            <Styles>
                                                <AlternatingRow BackColor="#E9E9E9">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
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
