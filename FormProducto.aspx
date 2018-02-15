<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormProducto.aspx.cs" Inherits="Connecting.Web.FormProducto" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        var postponedCallbackValue = null;

        function OnEndCallbackPanel(s, e) {
            if (postponedCallbackValue != null) {
                callbackPanel.PerformCallback(postponedCallbackValue);
                postponedCallbackValue = null;
            }
        }

        function PerfilChanged(s, e) {

            if (callbackPanel.InCallback()) {
                postponedCallbackValue = s.GetValue() + "-perfil";
            } else {
                callbackPanel.PerformCallback(s.GetValue() + "-perfil");
            }
        }

        function CategoriaChanged(s, e) {
            if (callbackPanel.InCallback()) {
                postponedCallbackValue = s.GetValue() + "-categoria";
            } else {
                callbackPanel.PerformCallback(s.GetValue() + "-categoria");
            }

        }

        function SubCategoriaChanged(s, e) {
            if (callbackPanel.InCallback()) {
                postponedCallbackValue = s.GetValue() + "-subcategoria";
            } else {
                callbackPanel.PerformCallback(s.GetValue() + "-subcategoria");
            }
        }

    </script>

    <div class="form-envolver-pagina">
        <div class="form-titulo-principal"><span>Catálogo de Productos</span></div>

        <dx:ASPxCallbackPanel ID="callbackPanel" runat="server" OnCallback="callbackPanel_Callback" CssClass="PanelPrincipal" ClientInstanceName="callbackPanel">
            <ClientSideEvents EndCallback="OnEndCallbackPanel"></ClientSideEvents>
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
                        AlignItemCaptionsInAllGroups="true" Width="100%" >
                        <Items>
                            <dx:LayoutGroup Caption="Producto" GroupBoxDecoration="None" SettingsItemCaptions-HorizontalAlign="Right">
                                <Items>
                                    <dx:LayoutItem Caption="Perfil">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox ID="cmbPerfilProducto" ClientInstanceName="cmbPerfilProducto" runat="server"
                                                    ValueType="System.Int32" TextField="NombrePerfilProducto" ValueField="IdPerfilProducto" AutoPostBack="false" Width="450px">
                                                    <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                    <ClientSideEvents SelectedIndexChanged="PerfilChanged" />
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Categoria">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox ID="cmbCategoria" ClientInstanceName="cmbCategoria" runat="server"
                                                    ValueType="System.Int32" TextField="NombreCategoriaProducto" ValueField="IdCategoriaProducto" AutoPostBack="false" Width="450px">
                                                    <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                    <ClientSideEvents ValueChanged="CategoriaChanged" />
                                                    <%--EndCallback="OnSubCategoriaEndCallback"--%>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Sub Categoria">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxComboBox ID="cmbTipoProducto" ClientInstanceName="cmbTipoProducto" runat="server"
                                                    ValueType="System.Int32" TextField="NombreTipoProducto" ValueField="IdTipoProducto" Width="450px" NullText="No Aplicar">
                                                    <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                    <ClientSideEvents ValueChanged="SubCategoriaChanged"></ClientSideEvents>
                                                    <%--EndCallback="OnProductoEndCallback"--%>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxLabel ID="lblError" ClientInstanceName="lblError" runat="server" ForeColor="Red"></dx:ASPxLabel>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>

                                    <dx:LayoutItem Caption="">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdProducto" Width="100%" AutoGenerateColumns="False" OnRowDeleting="grid_RowDeleting" OnRowInserting="grid_RowInserting"
                                                    OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ButtonType="Image" Caption="Borrar" ShowDeleteButton="True" VisibleIndex="11" Width="30px">
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption=" ID" FieldName="IdProducto" VisibleIndex="0" ReadOnly="True" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" VisibleIndex="2">
                                                            <PropertiesTextEdit>
                                                                <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                                    <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                                </ValidationSettings>
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewCommandColumn Caption="Editar" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="10" Width="30px" ButtonRenderMode="Image" ButtonType="Image" ShowNewButtonInHeader="True">
                                                        </dx:GridViewCommandColumn>
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
                                                        <DeleteButton RenderMode="Button">
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
                                                    <SettingsText Title="Producto" />
                                                    <SettingsPopup>
                                                        <EditForm Width="550px"  Modal="True"/>
                                                    </SettingsPopup>
                                                    <SettingsPager PageSize="25"></SettingsPager>
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
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

</asp:Content>
