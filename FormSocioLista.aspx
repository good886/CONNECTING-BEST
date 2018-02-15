<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormSocioLista.aspx.cs" Inherits="Connecting.Web.FormSocioLista" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
        function OnGridEndCallback(s, e) {

            if (typeof gridSocios.cpMsgSelectivo !== "undefined") {
                if (gridSocios.cpMsgError != '')
                    alert(gridSocios.cpMsgError);
            }
        }
    </script>

    <div class="form-envolver-pagina">
        <div class="form-titulo-principal"><span>Listado de Socios</span></div>

        <dx:ASPxGridView ID="gridSocios" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdSocio;IdPerfilProducto"
            OnCellEditorInitialize="gridSocios_CellEditorInitialize" ClientInstanceName="gridSocios" OnRowDeleting="gridSocios_RowDeleting">
            <SettingsText ConfirmDelete="Confirma anular este perfil?, el usuario asociado también será anulaado." />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="11" Caption="Editar" Width="30px" ShowNewButtonInHeader="True" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Comercial" FieldName="NombreComercial" Name="NombreComercial" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Telefono" FieldName="NumeroTelefono" Name="Telefono" VisibleIndex="5" Width="80px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Skype" FieldName="UsuarioSype" Name="Skype" VisibleIndex="6">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nit" FieldName="Nit" Name="Nit" VisibleIndex="1" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Codigo SAP" FieldName="CodigoSap" Name="CodigoSap" VisibleIndex="2" Width="80px" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Match" FieldName="IdSocio" Name="Match" VisibleIndex="12" Width="20px">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="MatchSocios.aspx?Id={0}" Target="_self" Text="Consultar" TextFormatString="Consultar" ImageUrl="~/Content/Images/match.png">
                    </PropertiesHyperLinkEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Estado" FieldName="Estado" Name="Estado" VisibleIndex="9" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Membresia" FieldName="NombreMembresia" Name="NombreMembresia" VisibleIndex="8" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn Caption="Anular" ShowDeleteButton="True" VisibleIndex="12" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Formulario" FieldName="NombrePerfilProducto" Name="NombrePerfilProducto" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
            <SettingsPager PageSize="15"></SettingsPager>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
            <SettingsCommandButton>
                <NewButton RenderMode="Button">
                    <Image Url="Content/Images/Nuevo.png"></Image>
                </NewButton>
                <UpdateButton ButtonType="Button" RenderMode="Button" Text="Aceptar">
                </UpdateButton>
                <CancelButton ButtonType="Button" RenderMode="Button" Text="Cancelar">
                </CancelButton>
                <EditButton RenderMode="Button">
                    <Image Url="Content/Images/editar.png"></Image>
                </EditButton>
                <DeleteButton RenderMode="Button" Text="Anular">
                    <Image Url="Content/Images/Borrar.png" ></Image>
                </DeleteButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <ClearFilterButton>
                    <Image Url="Content/Images/clear.png"></Image>
                </ClearFilterButton>
            </SettingsCommandButton>
            <ClientSideEvents EndCallback="OnGridEndCallback"></ClientSideEvents>
            <Styles>
                <FilterCell BackColor="#E2E2E2">
                </FilterCell>
            </Styles>
        </dx:ASPxGridView>

    </div>

</asp:Content>
