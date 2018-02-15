<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleSocio.aspx.cs" Inherits="Connecting.Web.DetalleSocio" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <style type="text/css">
        .layoutGroupBoxCaption {
            font-size: 20px;
            font-weight: bold;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server" style="width: 100%;">
        <dx:ASPxFormLayout ID="frlSocio" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption" Width="100%"
            AlignItemCaptionsInAllGroups="True" Paddings="15px" Theme="Moderno">
            <Items>
                <dx:LayoutGroup Caption="Asociado AGEXPORT: " GroupBoxDecoration="HeadingLine" ShowCaption="True" ColCount="2">
                    <Items>
                        <dx:LayoutItem ShowCaption="True" Caption="Dirección">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblDireccion" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="True" Caption="Pagina Web">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblPaginaWeb" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>

                        <dx:LayoutItem ShowCaption="True" Caption="Telefono">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblTelefono" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="True" Caption="Número de Empleados">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblEmpleados" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="True" Caption="Añor de Fundación">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblFunadacion" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="True" Caption="Skype de la Empresa:">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxLabel ID="lblSkype" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>

                    </Items>
                    <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                </dx:LayoutGroup>
                <dx:TabbedLayoutGroup ActiveTabIndex="0" Width="100%">
                    <Items>
                        <dx:LayoutGroup Caption="Certificaciones" Name="tabCertificaciones">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Caption="" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridCertificaciones" runat="server" Width="100%" AutoGenerateColumns="False"
                                                Theme="Moderno" OnAfterPerformCallback="gridCertificaciones_AfterPerformCallback">
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Certificación" FieldName="NombreCertificacion" Name="NombreCertificacion" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Importancia" FieldName="DescripcionImportancia" Name="DescripcionImportancia" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="¿Cumple?" FieldName="Cumple" Name="Cumple" ShowInCustomizationForm="True" VisibleIndex="3" ToolTip="Indica si el socio cumple con la certificación indicada" Width="60px">
                                                        <PropertiesCheckEdit ValueChecked="N" ValueType="System.String" ValueUnchecked="S">
                                                            <DisplayImageChecked Url="~\IMG\cert_si.png" Width="20px" Height="20px">
                                                            </DisplayImageChecked>
                                                            <DisplayImageUnchecked Height="20px" Url="~/IMG/cert_no.png" Width="20px">
                                                            </DisplayImageUnchecked>
                                                        </PropertiesCheckEdit>
                                                    </dx:GridViewDataCheckColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Contactos" Name="tabContactos">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Caption="" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridContactos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdContacto" Theme="Moderno"
                                                OnAfterPerformCallback="gridContactos_AfterPerformCallback" OnCustomErrorText="gridContactos_CustomErrorText">
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataBinaryImageColumn FieldName="Tarjeta" VisibleIndex="0">
                                                        <PropertiesBinaryImage ImageHeight="140px" ImageWidth="140px" NullDisplayText="Imagen no dispobible">
                                                        </PropertiesBinaryImage>
                                                    </dx:GridViewDataBinaryImageColumn>
                                                    <dx:GridViewDataCheckColumn Caption="Principal" FieldName="IdTipoContacto" Name="IdTipoContacto" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px">
                                                        <PropertiesCheckEdit ValueChecked="P" ValueType="System.String" ValueUnchecked="S">
                                                        </PropertiesCheckEdit>
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" Name="Nombre" ShowInCustomizationForm="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Puesto" FieldName="Puesto" Name="Puesto" ShowInCustomizationForm="True" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Correo" FieldName="Correo" Name="Correo" ShowInCustomizationForm="True" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager PageSize="3"></SettingsPager>
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Exportación" Name="tabExportacion">
                            <Items>
                                <dx:LayoutItem ShowCaption="True" Caption="Exportaciones Actuales" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridPaisExporta" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdPaisExporta" Theme="Moderno"
                                                OnAfterPerformCallback="gridPaisExporta_AfterPerformCallback">
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" Name="ProductoExporta" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Pais" FieldName="NombrePais" Name="NombrePaisExporta" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="True" Caption="Crecimiento de las exportaciones en los últimos tres años, mercados nuevos a los que ha ingresado" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridMercadosCrecimiento" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioMercado" Theme="Moderno"
                                                OnAfterPerformCallback="gridMercadosCrecimiento_AfterPerformCallback">
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    <NewButton>
                                                        <Image Url="~/IMG/Nuevo.png"></Image>
                                                    </NewButton>
                                                    <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                    <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                    <EditButton>
                                                        <Image Url="~/IMG/Editar.png"></Image>
                                                    </EditButton>
                                                    <DeleteButton>
                                                        <Image Url="~/IMG/Borrar.png"></Image>
                                                    </DeleteButton>
                                                    <ClearFilterButton>
                                                        <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                    </ClearFilterButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Nombre de Mercado" FieldName="NombreMercado" Name="NombreMercado" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom">
                                                </SettingsEditing>
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem ShowCaption="True" Caption="Aumento porcentual de las exportaciones y paises destino" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridAumentoPorcentual" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioCrecimiento" Theme="Moderno"
                                                OnAfterPerformCallback="gridAumentoPorcentual_AfterPerformCallback">
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    <NewButton>
                                                        <Image Url="~/IMG/Nuevo.png"></Image>
                                                    </NewButton>
                                                    <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                    <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                    <EditButton>
                                                        <Image Url="~/IMG/Editar.png"></Image>
                                                    </EditButton>
                                                    <DeleteButton>
                                                        <Image Url="~/IMG/Borrar.png"></Image>
                                                    </DeleteButton>
                                                    <ClearFilterButton>
                                                        <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                                                    </ClearFilterButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volumen (%)" FieldName="Volumen" Name="Volumen" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Valor (%)" FieldName="ValorPorcentaje" Name="Valor" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Pais" FieldName="IdPais" Name="PaisExporta" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesComboBox TextField="NombrePais" ValueField="IdPais">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                </Columns>
                                                <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                            </dx:ASPxGridView>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="¿Cuanto más pueden crecer las exportaciones?" RequiredMarkDisplayMode="Auto" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxMemo ID="txtDescripcionCrecimientoExport" runat="server" Height="100px" Width="100%" ReadOnly="True">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>

                                    <CaptionSettings Location="Top"></CaptionSettings>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Mercado" Name="tabMercados">
                            <Items>
                                <dx:LayoutItem ShowCaption="True" Caption="Mercados comerciales para esta empresa" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <div style="overflow: auto; height: 450px">
                                                <dx:ASPxCheckBoxList ID="lstMercadoSolicita" runat="server" Width="100%" RepeatColumns="4"
                                                    TextField="NombrePais" ValueField="IdPais" Theme="Moderno" ReadOnly="True">
                                                    <Items>
                                                    </Items>
                                                </dx:ASPxCheckBoxList>
                                            </div>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Comprador" Name="tabComprador">
                            <Items>
                                <dx:LayoutItem Caption="Perfil de comprador que busca" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxCheckBoxList ID="lstPerfilComprador" runat="server" Width="100%" RepeatColumns="2" Theme="Moderno"
                                                TextField="ActividadComercial" ValueField="IdActividadComercial" ValueType="System.Int32" ReadOnly="True">
                                                <Items>
                                                </Items>
                                            </dx:ASPxCheckBoxList>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>

                                    <CaptionSettings Location="Top"></CaptionSettings>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Otros" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxTextBox ID="txtOtrosCompradorBusca" runat="server" Width="100%" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>

                                    <CaptionSettings Location="Top"></CaptionSettings>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Describa con detalle el tipo de comprador que busca" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxMemo ID="txtDetalleCompradorBusca" runat="server" Height="100px" Width="100%" Theme="Moderno" ReadOnly="True">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>

                                    <CaptionSettings Location="Top"></CaptionSettings>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="¿Tiene identificado algún cliente en específico que quisiera que contactemos de inmediato?" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer>
                                            <dx:ASPxMemo ID="txtClienteCtoInmediato" runat="server" Height="100px" Width="100%" Theme="Moderno" ReadOnly="True">
                                            </dx:ASPxMemo>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>

                                    <CaptionSettings Location="Top"></CaptionSettings>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                        <dx:LayoutGroup Caption="Adjuntos" Name="tabAdjuntos">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" Caption="" CaptionSettings-Location="Top">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server">
                                            <dx:ASPxGridView ID="gridDocumentosAdjuntos" runat="server" Width="100%" AutoGenerateColumns="False" Theme="Moderno"
                                                OnAfterPerformCallback="gridDocumentosAdjuntos_AfterPerformCallback"
                                                KeyFieldName="IdSocioDocumento">
                                                <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm">
                                                </SettingsEditing>
                                                <SettingsBehavior ConfirmDelete="True" />
                                                <SettingsCommandButton>
                                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                </SettingsCommandButton>
                                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" Name="Descripcion" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataHyperLinkColumn Caption="Descargar" FieldName="IdSocioDocumento" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                                        <PropertiesHyperLinkEdit ClientInstanceName="Ver" ImageUrl="~/IMG/dowload.png" NavigateUrlFormatString="Viewer.aspx?id={0}" Target="_blank" TextFormatString="">
                                                            <Style HorizontalAlign="Center">
                                                            </Style>
                                                        </PropertiesHyperLinkEdit>
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataHyperLinkColumn>

                                                </Columns>
                                            </dx:ASPxGridView>

                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings Location="Top"></CaptionSettings>
                                    <CaptionStyle Font-Bold="True"></CaptionStyle>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:TabbedLayoutGroup>
            </Items>
            <Styles>
                <LayoutGroupBox>
                    <Caption CssClass="layoutGroupBoxCaption"></Caption>
                </LayoutGroupBox>
            </Styles>
        </dx:ASPxFormLayout>

    </form>
</body>
</html>
