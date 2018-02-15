<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetalleComprador.aspx.cs" Inherits="Connecting.Web.DetalleComprador" %>

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
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout ID="frlComprador" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption" Width="100%"
                AlignItemCaptionsInAllGroups="True" Paddings="15px" Theme="Moderno" >
                <Items>
                    <dx:LayoutGroup Caption="Comprador: " GroupBoxDecoration="HeadingLine" ShowCaption="True" ColCount="2">
                        <Items>
                            <dx:LayoutItem ShowCaption="True" Caption="Dirección">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxLabel ID="lblDireccion" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle Font-Bold="True"></CaptionStyle>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="True" Caption="Pais:">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxLabel ID="lblPais" runat="server" Theme="Moderno"></dx:ASPxLabel>
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

                            <dx:LayoutItem ShowCaption="True" Caption="Año de Fundación">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxLabel ID="lblAnioFundacion" runat="server" Theme="Moderno"></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionStyle Font-Bold="True"></CaptionStyle>
                            </dx:LayoutItem>
                        </Items>
                        <SettingsItemCaptions HorizontalAlign="Right" Location="Left" />
                    </dx:LayoutGroup>
                    <dx:TabbedLayoutGroup ActiveTabIndex="0" Width="100%" >
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
                                                <dx:ASPxGridView ID="gridContacto" KeyFieldName="IdContacto" ClientInstanceName="gridContacto" runat="server" AutoGenerateColumns="False" Width="100%"
                                                    Theme="Moderno" OnAfterPerformCallback="gridContacto_OnAfterPerformCallback">
                                                    <Columns>
                                                        <dx:GridViewDataCheckColumn Caption="Principal" FieldName="IdTipoContacto" Name="IdTipoContacto" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px">
                                                            <PropertiesCheckEdit ValueChecked="P" ValueType="System.String" ValueUnchecked="S">
                                                            </PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2" Name="Nombre">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Puesto" FieldName="Puesto" ShowInCustomizationForm="True" VisibleIndex="3" Name="Puesto">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Telefono" FieldName="Telefono" ShowInCustomizationForm="True" VisibleIndex="4" Name="Telefono">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Email" FieldName="Correo" ShowInCustomizationForm="True" VisibleIndex="5" Name="Correo">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Usuario Skype" FieldName="UsuarioSkype" ShowInCustomizationForm="True" VisibleIndex="6" Name="UsuarioSkype">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataBinaryImageColumn FieldName="Tarjeta" VisibleIndex="0">
                                                            <PropertiesBinaryImage ImageHeight="140px" ImageWidth="140px" NullDisplayText="[Imagen no disponible]" ToolTip="Seleccione la imagen que corresponde a la tarjeta de presentación del socio actual">
                                                            </PropertiesBinaryImage>
                                                        </dx:GridViewDataBinaryImageColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                    <SettingsText Title="Contacto" />
                                                    <SettingsPager PageSize="3"></SettingsPager>
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Importación" Name="tabImportacion">
                                <Items>
                                    <dx:LayoutItem ShowCaption="True" Caption="Productos importados de Guatemala" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridView ID="gridImportacion" ClientInstanceName="gridImportacion" Theme="Moderno" runat="server" KeyFieldName="IdImportacion"
                                                    AutoGenerateColumns="False" Width="100%" OnAfterPerformCallback="gridImportacion_AfterPerformCallback">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption=" Id" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="IdImportacion" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="Cantidad" Width="120px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="3" FieldName="Frecuencia" Width="120px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Comprador" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False" FieldName="IdComprador">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Proveedor" Name="Proveedor" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsText Title="Importación" />
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="True" Caption="Actividad Comercial" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxCheckBoxList ID="lstchkActividadComercial" runat="server" Width="100%" RepeatColumns="2"
                                                    TextField="ActividadComercial" ValueField="IdActividadComercial" Theme="Moderno" AutoPostBack="false" ClientInstanceName="lstchkActividadComercial" ReadOnly="True">
                                                    <Items>
                                                    </Items>
                                                </dx:ASPxCheckBoxList>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="True" Caption="Otros" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxTextBox ID="txtActividadComercialOtros" runat="server" Theme="Moderno" Width="100%"></dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="True" Caption="Porductos importados de Centro America" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridView ID="gridImportacionCA" ClientInstanceName="gridImportacionCA" Theme="Moderno" runat="server" KeyFieldName="IdImportacion"
                                                    AutoGenerateColumns="False" Width="100%" OnAfterPerformCallback="gridImportacionCA_AfterPerformCallback">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" VisibleIndex="4" FieldName="Cantidad" Width="120px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Frecuencia" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="Frecuencia" Width="120px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Comprador" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False" FieldName="IdComprador">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="3" Width="300px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Proveedor" Name="Proveedor" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Pais" FieldName="NombrePais" ShowInCustomizationForm="True" VisibleIndex="1" Width="120px">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsText Title="Importación" />
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Distribución" Name="tabDistribucion">
                                <Items>
                                    <dx:LayoutItem Caption="Número de tiendas y centros de distribución" ShowCaption="True">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxTextBox ID="txtNumeroTiendas" runat="server" Theme="Moderno"></dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem ShowCaption="False" Caption="" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridView ID="gridCentrosDistribucion" ClientInstanceName="gridCentrosDistribucion" Theme="Moderno" runat="server" KeyFieldName="IdDistribucion"
                                                    AutoGenerateColumns="False" OnAfterPerformCallback="gridCentrosDistribucion_OnAfterPerformCallback" Width="100%">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Ubicación" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="Ubicacion">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Comprador" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False" FieldName="IdComprador">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsText Title="Distribución" />
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Forma de Importacion" ShowCaption="True">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxRadioButtonList ID="rblFormaImmportacion" Theme="Moderno" RepeatColumns="2" runat="server" ValueType="System.String" TextAlign="Left" SelectedIndex="0" Width="100%">
                                                    <Items>
                                                        <dx:ListEditItem Text="Directo" Value="D" Selected="True" />
                                                        <dx:ListEditItem Text="Por medio de importador" Value="I" />
                                                    </Items>
                                                </dx:ASPxRadioButtonList>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings HorizontalAlign="Left" Location="Left" />
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="Información de los Importadores" ShowCaption="True">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxGridView ID="gridFormaImportar" Theme="Moderno" ClientInstanceName="gridFormaImportar" KeyFieldName="IdCompradorDistribuidor" runat="server" AutoGenerateColumns="False"
                                                    OnAfterPerformCallback="gridFormaImportar_OnAfterPerformCallback" Width="100%">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Id Comprador" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" FieldName="IdComprador">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="40px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Telefono" FieldName="Telefono" Name="Telefono" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Name="Email" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreDistribuidor" Name="NombreDistribuidor" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsText Title="Importadores" />
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings HorizontalAlign="Left" Location="Top" />
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Formas de Pago" Name="tabFormasPago">
                                <Items>
                                    <dx:LayoutItem Caption="Formas de Pago" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxGridView ID="gridFormaPago" Theme="Moderno" KeyFieldName="IdCompradorFormaPago" ClientInstanceName="gridFormaPago" runat="server"
                                                    AutoGenerateColumns="False" Width="100%" OnAfterPerformCallback="gridFormaPago_OnAfterPerformCallback">
                                                    <SettingsText Title="Forma de Pago" />
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Forma Pago" ShowInCustomizationForm="True" VisibleIndex="6" FieldName="FormaPago" Width="200px" ReadOnly="True">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Plazo de Crédito" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxGridView ID="gridPlazoCredito" Theme="Moderno" KeyFieldName="IdCompradorPlazoCredito" ClientInstanceName="gridPlazoCredito" runat="server"
                                                    AutoGenerateColumns="False" Width="100%" OnAfterPerformCallback="gridPlazoCredito_OnAfterPerformCallback">
                                                    <SettingsText Title="Plazo de Credito" />
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsDataSecurity AllowInsert="False" AllowDelete="False" AllowEdit="False" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Plazo Credito" ShowInCustomizationForm="True" VisibleIndex="6" FieldName="PlazoCredito" Width="200px" ReadOnly="True">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Otros" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxMemo ID="txtOtrosFormaPago" runat="server" Height="100px" Width="100%" Theme="Moderno"></dx:ASPxMemo>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                        <CaptionSettings Location="Top"></CaptionSettings>
                                        <CaptionStyle Font-Bold="True"></CaptionStyle>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Ferias" Name="tabFerias">
                                <Items>
                                    <dx:LayoutItem Caption="Historial de participación" ShowCaption="True" CaptionSettings-Location="Top">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxGridView ID="gridFeria" Theme="Moderno" ClientInstanceName="gridFeria" runat="server" KeyFieldName="IdCompradorFeria"
                                                    AutoGenerateColumns="False" OnAfterPerformCallback="gridFeria_OnAfterPerformCallback" Width="100%">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Feria" ShowInCustomizationForm="True" VisibleIndex="1" FieldName="NombreFeria" Width="250px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataSpinEditColumn Caption="Año" FieldName="Anio" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                                            <PropertiesSpinEdit DisplayFormatString="g"></PropertiesSpinEdit>
                                                        </dx:GridViewDataSpinEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Que Producto?" ShowInCustomizationForm="True" VisibleIndex="5" FieldName="Producto">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn Caption="Realizo Compras" FieldName="RealizoCompras" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                                            <PropertiesCheckEdit ValueChecked="S" ValueGrayed="N" ValueType="System.String" ValueUnchecked="N">
                                                            </PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                    </Columns>
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                    </SettingsCommandButton>
                                                    <SettingsText Title="Feria" />
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

        </div>
    </form>
</body>
</html>
