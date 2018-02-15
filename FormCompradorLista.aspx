<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormCompradorLista.aspx.cs" Inherits="Connecting.Web.FormCompradorLista" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .formLayoutContainer {
            width: 100%;
            /*margin: auto;*/
            background: White;
        }

        .layoutGroupBoxCaption {
            font-size: 16px;
        }
    </style>

    <script type="text/javascript">

        function OnGridEndCallback(s, e) {
            if (typeof gridComprador.cpMsgSelectivo !== "undefined") {
                if (gridComprador.cpMsgError != '')
                    alert(gridComprador.cpMsgError);
            }
        }
    </script>

    <div class="form-envolver-pagina">
        <div class="form-titulo-principal"><span>Listado de Compradores</span></div>
        <dx:ASPxGridView ID="gridComprador" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdComprador"
            ClientInstanceName="gridComprador" OnCellEditorInitialize="gridComprador_CellEditorInitialize">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="7" Caption="Editar" Width="30px" ShowNewButtonInHeader="True" ShowEditButton="True" ButtonRenderMode="Button" ButtonType="Button">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Empresa" FieldName="NombreComercial" Name="NombreEmpresa" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Dirección" FieldName="Direccion" Name="Direccion" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Telefono" FieldName="NumeroTelefono" Name="NumeroTelefono" VisibleIndex="3" Width="80px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pagina Web" FieldName="PaginaWeb" Name="PaginaWeb" VisibleIndex="4" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Código" FieldName="IdComprador" Name="IdComprador" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Match" FieldName="IdComprador" Name="Match" VisibleIndex="8" Width="20px">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="MatchCompradores.aspx?Id={0}" Target="_self" Text="Consultar" TextFormatString="Consultar" ImageUrl="~/Content/Images/match.png">
                    </PropertiesHyperLinkEdit>
                    <Settings AllowAutoFilter="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Estado" FieldName="Estado" Name="Estado" VisibleIndex="6" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Membresia" FieldName="NombreMembresia" Name="NombreMembresia" VisibleIndex="5" Width="100px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
            <SettingsPager PageSize="20"></SettingsPager>
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <NewButton Text="Nuevo" ButtonType="Button">
                    <Image Url="Content/Images/nuevo.png"></Image>
                </NewButton>
                <UpdateButton Text="Aceptar" ButtonType="Button"></UpdateButton>
                <CancelButton Text="Cancelar" ButtonType="Button"></CancelButton>
                <EditButton Text="Editar" ButtonType="Button">
                    <Image Url="Content/Images/editar.png"></Image>
                </EditButton>
                <DeleteButton Text="Borrar">
                    <Image Url="Content/Images/borrar.png"></Image>
                </DeleteButton>
            </SettingsCommandButton>
            <ClientSideEvents EndCallback="OnGridEndCallback"></ClientSideEvents>
            <Styles>
                <FilterCell BackColor="#E2E2E2"></FilterCell>
            </Styles>
        </dx:ASPxGridView>
    </div>
</asp:Content>
