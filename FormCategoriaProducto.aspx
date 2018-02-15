<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormCategoriaProducto.aspx.cs" Inherits="Connecting.Web.FormCategoriaProducto" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        var postponedCallbackValue = null;

        function PerfilChanged(s, e) {

            if (grid.InCallback()) {
                postponedCallbackValue = s.GetValue();
            } else {
                grid.PerformCallback(s.GetValue());
            }
        }

        function OnEndCallback(s, e) {

            if (postponedCallbackValue != null) {
                grid.PerformCallback(postponedCallbackValue);
                postponedCallbackValue = null;
            }
        }
    </script>


    <div class="form-envolver-pagina">
        <dx:ASPxFormLayout ID="flyAprobacion" runat="server" Styles-LayoutGroupBox-Caption-CssClass="layoutGroupBoxCaption"
            AlignItemCaptionsInAllGroups="True" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Catalogo de categoria de producto" GroupBoxDecoration="HeadingLine">
                    <Items>
                        <dx:LayoutItem Caption="Formulario">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox ID="cmbPerfilProducto" ClientInstanceName="cmbPerfilProducto" runat="server"
                                        ValueType="System.Int32" TextField="NombrePerfilProducto" ValueField="IdPerfilProducto" AutoPostBack="false" Width="350px" NullText="Seleccionar Formulario">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="valProducto">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                        <ClientSideEvents ValueChanged="PerfilChanged" />
                                    </dx:ASPxComboBox>
                                    <dx:ASPxLabel ID="lblError" runat="server" Text="" EnableViewState="False" ForeColor="Red">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings Location="Top" HorizontalAlign="Left"></CaptionSettings>
                            <Paddings PaddingBottom="15px" />
                            <CaptionCellStyle>
                                <Paddings PaddingBottom="5px" />
                            </CaptionCellStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Categorías">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdCategoriaProducto" Width="100%" AutoGenerateColumns="False" OnRowDeleting="grid_RowDeleting"
                                        OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating" OnAfterPerformCallback="grid_AfterPerformCallback" ClientInstanceName="grid">
                                        <Columns>
                                            <dx:GridViewCommandColumn VisibleIndex="10" Width="30px" ButtonType="Image"
                                                Caption="Nuevo" ShowNewButtonInHeader="True" ShowEditButton="True">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewCommandColumn ButtonType="Image" Caption="Borrar"
                                                ShowDeleteButton="True" VisibleIndex="11" Width="30px">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption=" Id" FieldName="IdCategoriaProducto" VisibleIndex="0" ReadOnly="True" Visible="False">
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nombre" FieldName="NombreCategoriaProducto" VisibleIndex="1">
                                                <PropertiesTextEdit>
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                                                    </ValidationSettings>
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsCommandButton>
                                            <NewButton>
                                                <Image Url="Content/Images/Nuevo.png"></Image>
                                            </NewButton>
                                            <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar">
                                            </UpdateButton>
                                            <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar">
                                            </CancelButton>
                                            <EditButton>
                                                <Image Url="Content/Images/Editar.png"></Image>
                                            </EditButton>
                                            <DeleteButton>
                                                <Image Url="Content/Images/Borrar.png"></Image>
                                            </DeleteButton>
                                            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                            <ClearFilterButton>
                                                <Image Url="Content/Images/clear.png"></Image>
                                            </ClearFilterButton>
                                        </SettingsCommandButton>
                                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                        <SettingsPager PageSize="25"></SettingsPager>
                                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
                                        <SettingsText Title="Categoría Producto" />
                                        <SettingsPopup>
                                            <EditForm Width="550px" Modal="True" />
                                        </SettingsPopup>
                                        <ClientSideEvents EndCallback="OnEndCallback"></ClientSideEvents>
                                        <Styles>
                                            <%--<FocusedRow CssClass="grid-focusRow"></FocusedRow>--%>
                                            <%--<SelectedRow CssClass="grid-focusRow"></SelectedRow>--%>
                                        </Styles>
                                    </dx:ASPxGridView>

                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionCellStyle>
                                <Paddings PaddingBottom="5px" />
                            </CaptionCellStyle>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions HorizontalAlign="Left" Location="Top"></SettingsItemCaptions>
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
