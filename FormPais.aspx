<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormPais.aspx.cs" Inherits="Connecting.Web.FormPais" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        function OnGridEndCallback(s, e) {
            if (typeof grid.cpActivar !== "undefined") {
                if (grid.cpActivar == '')
                    popActivarPais.Hide();
                else
                    popActivarPais.Show();
            }
        }

        function Activar() {
            grid.PerformCallback(grid.cpActivar);
        }

    </script>

    <div class="form-envolver-pagina">
        <div class="form-titulo-principal"><span>Catálogo de País</span></div>

        <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdPais" Width="100%" AutoGenerateColumns="False"
            OnRowDeleting="grid_RowDeleting" OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating" ClientInstanceName="grid"
            OnAutoFilterCellEditorInitialize="grid_AutoFilterCellEditorInitialize" OnCellEditorInitialize="grid_CellEditorInitialize" OnCustomCallback="grid_CustomCallback">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="10" Width="30px" ButtonType="Image"
                    Caption="Nuevo" ShowNewButtonInHeader="True" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn ButtonType="Image" Caption="Borrar"
                    ShowDeleteButton="True" VisibleIndex="11" Width="30px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Código:" FieldName="IdPais" VisibleIndex="0" Width="30px">
                    <PropertiesTextEdit MaxLength="3">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pais" FieldName="NombrePais" VisibleIndex="1">
                    <PropertiesTextEdit MaxLength="150">
                        <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                            <RequiredField ErrorText="Requerido" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
            <SettingsCommandButton>
                <NewButton RenderMode="Button">
                    <Image Url="Content/Images/nuevo.png"></Image>
                </NewButton>
                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar"></UpdateButton>
                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar"></CancelButton>
                <EditButton RenderMode="Button">
                    <Image Url="Content/Images/editar-b.png"></Image>
                </EditButton>
                <DeleteButton RenderMode="Button">
                    <Image Url="Content/Images/borrar.png"></Image>
                </DeleteButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <ClearFilterButton RenderMode="Button">
                    <Image Url="Content/Images/clear.png"></Image>
                </ClearFilterButton>
            </SettingsCommandButton>
            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
            <SettingsText Title="Tipo Producto" />
            <SettingsPopup>
                <EditForm Width="550px" Modal="True" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="true" />
            <SettingsPager PageSize="15"></SettingsPager>
            <ClientSideEvents EndCallback="OnGridEndCallback"></ClientSideEvents>
        </dx:ASPxGridView>

        <dx:ASPxPopupControl ID="popActivarPais" runat="server" ClientInstanceName="popActivarPais" Width="400px" HeaderText="Activar Pais"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table>
                        <tr>
                            <td>
                                <span>El país que intenta ingresar ya existe pero ha sido dado de baja, desea activarlo nuevamente?</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <div style="float: right">
                                    <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                        popActivarPais.Hide();
                                        }"></ClientSideEvents>
                                    </dx:ASPxButton>
                                </div>
                                <div style="float: right; padding-right: 10px">
                                    <dx:ASPxButton ID="btnActivar" runat="server" Text="Activar" AutoPostBack="False">
                                        <ClientSideEvents Click="Activar"></ClientSideEvents>
                                    </dx:ASPxButton>
                                </div>

                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>
</asp:Content>
