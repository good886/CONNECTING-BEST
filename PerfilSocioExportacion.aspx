<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PerfilSocioExportacion.aspx.cs" Inherits="Connecting.Web.PerfilExportacion" %>
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

        function OnTabExportaActInit(s, e) {
            s.SetActiveTabIndex(rblExportaAct.GetSelectedIndex());
        }

        function OnExportaActChanged(s, e) {
            var selectedIndex = s.GetSelectedIndex();
            tlgExportaAct.SetActiveTabIndex(selectedIndex);
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
                                            <dx:ASPxLabel ID="lblHeader" runat="server" Text="Perfíl de Socio" Theme="Moderno" CssClass="header">
                                            </dx:ASPxLabel>
                                        </div>
                                        <div style="float: left">
                                            <dx:ASPxLabel ID="lblHeaderStep" runat="server" Text="Paso 3 de 7 - Datos de Exportación" CssClass="headerStep">
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

                    <dx:LayoutGroup Caption="Exportación" GroupBoxDecoration="HeadingLine" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False">
                        <Items>
                            <dx:LayoutGroup Caption="" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right" ShowCaption="False">
                                <Items>
                                    <dx:LayoutItem Caption="¿Exporta actualmente?">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxRadioButtonList ID="rblExportaAct" runat="server" RepeatDirection="Horizontal" Theme="Moderno" SelectedIndex="0" ClientInstanceName="rblExportaAct">
                                                    <ClientSideEvents SelectedIndexChanged="OnExportaActChanged" />
                                                    <Items>
                                                        <dx:ListEditItem Text="Si" Value="S" />
                                                        <dx:ListEditItem Text="No" Value="N" />
                                                    </Items>
                                                    <Border BorderStyle="None" />
                                                </dx:ASPxRadioButtonList>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:TabbedLayoutGroup ClientInstanceName="tlgExportaAct" ShowGroupDecoration="false" Width="100%">
                                        <ClientSideEvents Init="OnTabExportaActInit" />
                                        <Items>
                                            <dx:LayoutGroup GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right" HorizontalAlign="Left" ShowCaption="False">
                                                <Items>
                                                    <dx:LayoutItem Caption="">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxGridView ID="gridPaisExporta" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdPaisExporta" Theme="Moderno"
                                                                    OnCellEditorInitialize="gridPaisExporta_CellEditorInitialize" OnRowDeleting="gridPaisExporta_RowDeleting" OnRowInserting="gridPaisExporta_RowInserting" OnRowUpdating="gridPaisExporta_RowUpdating" OnAfterPerformCallback="gridPaisExporta_AfterPerformCallback">
                                                                    <SettingsCommandButton >
                                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                                        <NewButton Text="Nuevo" RenderMode="Button"><Image Url="~/IMG/Nuevo.png" ToolTip="Agregar un país al que se exporta"></Image></NewButton>
                                                                        <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                                                                        <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                                                                        <EditButton Text="Editar" RenderMode="Button"><Image Url="~/IMG/Editar.png"></Image></EditButton>
                                                                        <DeleteButton Text="Borrar" RenderMode="Button"><Image Url="~/IMG/Borrar.png"></Image></DeleteButton>
                                                                        <ClearFilterButton><Image Url="~/IMG/LimpiarBusqueda.png"></Image></ClearFilterButton>
                                                                    </SettingsCommandButton>
                                                                    <Columns>
                                                                        <dx:GridViewDataComboBoxColumn Caption="País" FieldName="NombrePais" Name="NombrePaisExporta" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesComboBox TextField="NombrePais" ValueField="IdPais"></PropertiesComboBox>
                                                                        </dx:GridViewDataComboBoxColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="Producto" Name="ProductoExporta" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" 
                                                                            VisibleIndex="2" Width="60px" ButtonType="Image"></dx:GridViewCommandColumn>
                                                                    </Columns>
                                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                                </dx:ASPxGridView>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                                <SettingsItemCaptions Location="Top"></SettingsItemCaptions>
                                            </dx:LayoutGroup>

                                            <dx:LayoutGroup GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right">
                                                <Items>
                                                </Items>
                                                <SettingsItemCaptions Location="Left"></SettingsItemCaptions>
                                            </dx:LayoutGroup>
                                        </Items>
                                    </dx:TabbedLayoutGroup>
                                </Items>
                                <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                            </dx:LayoutGroup>

                            <dx:LayoutGroup Caption="Crecimiento de sus exportaciones en los últimos tres años" GroupBoxDecoration="HeadingLine">
                                <Items>
                                    <dx:LayoutItem Caption="Mercados nuevos a los que ha ingresado">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridView ID="gridMercadosCrecimiento" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioMercado" Theme="Moderno" OnRowDeleting="gridMercadosCrecimiento_RowDeleting"
                                                    OnRowInserting="gridMercadosCrecimiento_RowInserting" OnRowUpdating="gridMercadosCrecimiento_RowUpdating" OnAfterPerformCallback="gridMercadosCrecimiento_AfterPerformCallback">
                                                    <SettingsCommandButton>
                                                        <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                                        <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                                        <NewButton Text="Nuevo" RenderMode="Button">
                                                            <Image Url="~/IMG/Nuevo.png" ToolTip="Agregar un mercado"></Image>
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
                                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="1" Width="50px" ButtonType="Image">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre de Mercado" FieldName="NombreMercado" Name="NombreMercado" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom">
                                                    </SettingsEditing>
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Aumento porcentual de sus exportaciones y países destino">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxGridView ID="gridAumentoPorcentual" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocioCrecimiento" Theme="Moderno"
                                                    OnCellEditorInitialize="gridCrecimiento_CellEditorInitialize" OnRowDeleting="gridAumentoPorcentual_RowDeleting" OnRowInserting="gridAumentoPorcentual_RowInserting" 
                                                    OnRowUpdating="gridAumentoPorcentual_RowUpdating" OnAfterPerformCallback="gridAumentoPorcentual_AfterPerformCallback">
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
                                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="3" Width="50px" ButtonType="Image">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Volumen (%)" FieldName="Volumen" Name="Volumen" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Valor (%)" FieldName="ValorPorcentaje" Name="Valor" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="País" FieldName="IdPais" Name="PaisExporta" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <PropertiesComboBox TextField="NombrePais" ValueField="IdPais">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                    </Columns>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                </dx:ASPxGridView>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="¿Cuanto más pueden crecer sus exportaciones? Describa" RequiredMarkDisplayMode="Auto">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                <dx:ASPxMemo ID="txtDescripcionCrecimientoExport" runat="server" Height="100px" Width="100%" Theme="Moderno">
                                                </dx:ASPxMemo>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                </Items>
                                <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>

                            </dx:LayoutGroup>

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
