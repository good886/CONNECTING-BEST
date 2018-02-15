<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormTipoProducto.aspx.cs" Inherits="Connecting.Web.FormTipoProducto" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var postponedCallbackValue = null;

        function PerfilChanged(s, e) {

            if (cmbCategoria.InCallback()) {
                postponedCallbackValue = s.GetValue();
            } else {
                cmbCategoria.PerformCallback(s.GetValue());
            }
            CategoriaChanged(null, e);
        }

        function OnEndCallback(s, e) {

            if (postponedCallbackValue != null) {
                cmbCategoria.PerformCallback(postponedCallbackValue);
                postponedCallbackValue = null;
            }
        }

        function CategoriaChanged(s, e) {
            var id = null;
            if (s != null)
                id = s.GetValue();

            if (grid.InCallback()) {
                postponedCallbackValue = id;
            } else {
                grid.PerformCallback(id);
            }
        }

        function OnCategoriaEndCallback(s, e) {
            if (postponedCallbackValue != null) {
                grid.PerformCallback(postponedCallbackValue);
                postponedCallbackValue = null;
            }
        }
    </script>

    <div class="form-envolver-pagina">

        <div class="form-titulo-principal"><span>Catálogo de subcategoria de producto</span></div>

        <dx:ASPxFormLayout ID="flyAprobacion" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
            AlignItemCaptionsInAllGroups="true" Width="100%" >
            <Items>
                <dx:LayoutGroup Caption="Producto" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right">
                    <Items>
                        <dx:LayoutItem Caption="Perfil">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxLabel ID="lblError" runat="server" Text="" EnableViewState="False" ForeColor="Red">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cmbPerfilProducto" ClientInstanceName="cmbPerfilProducto"  runat="server"
                                        ValueType="System.Int32" TextField="NombrePerfilProducto" ValueField="IdPerfilProducto" AutoPostBack="false" Width="450px">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                        <ClientSideEvents ValueChanged="PerfilChanged" />
                                    </dx:ASPxComboBox>

                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Categoria">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox ID="cmbCategoria" ClientInstanceName="cmbCategoria"  runat="server"
                                        ValueType="System.Int32" TextField="NombreCategoriaProducto" ValueField="IdCategoriaProducto" AutoPostBack="false" Width="450px" OnCallback="cmbCategoria_Callback">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                        <ClientSideEvents ValueChanged="CategoriaChanged" EndCallback="OnEndCallback" />
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdTipoProducto" Width="100%"  AutoGenerateColumns="False" OnRowDeleting="grid_RowDeleting"
                                        OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid" OnAfterPerformCallback="grid_AfterPerformCallback">
                                        <Columns>
                                            <dx:GridViewCommandColumn VisibleIndex="10" Width="30px" ButtonType="Image"
                                                Caption="Nuevo" ShowNewButtonInHeader="True" ShowEditButton="True">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewCommandColumn ButtonType="Image" Caption="Borrar"
                                                ShowDeleteButton="True" VisibleIndex="11" Width="30px">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="Sub Categoria" FieldName="NombreTipoProducto" VisibleIndex="2">
                                                <PropertiesTextEdit>
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsCommandButton>
                                            <NewButton RenderMode="Button">
                                                <Image Url="Content/Images/Nuevo.png"></Image>
                                            </NewButton>
                                            <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar">
                                            </UpdateButton>
                                            <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar">
                                            </CancelButton>
                                            <EditButton RenderMode="Button">
                                                <Image Url="Content/Images/Editar.png"></Image>
                                            </EditButton>
                                            <DeleteButton RenderMode="Button" Text="Borrar">
                                                <Image Url="Content/Images/Borrar.png"></Image>
                                            </DeleteButton>
                                            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                            <ClearFilterButton>
                                                <Image Url="Content/Images/clear.png"></Image>
                                            </ClearFilterButton>
                                        </SettingsCommandButton>
                                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                        <SettingsText Title="Tipo Producto" />
                                        <SettingsPopup>
                                            <EditForm Width="550px"  Modal="True"/>
                                        </SettingsPopup>
                                        <SettingsPager PageSize="25"></SettingsPager>
                                        <ClientSideEvents EndCallback="OnCategoriaEndCallback"></ClientSideEvents>
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions HorizontalAlign="Right"></SettingsItemCaptions>
                </dx:LayoutGroup>
            </Items>

            <Styles>
                <LayoutGroupBox>
                    <Caption CssClass="layoutGroupBoxCaption"></Caption>
                </LayoutGroupBox>
            </Styles>
        </dx:ASPxFormLayout>


    </div>

</asp:Content>
