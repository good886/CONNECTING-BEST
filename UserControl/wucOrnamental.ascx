<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucOrnamental.ascx.cs" Inherits="Connecting.Web.UserControl.wucOrnamental" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<script type="text/javascript">

    function endCallback(s, e) {
        if (s.cpError) {
            alert(s.cpError);
            s.cpError = "";
        }
    }

    function onUpdate(s, e) {
        s.UpdateEdit();
    }

</script>


<div class="per-prod-datos">

    <dx:ASPxGridView ID="gridProductos" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="IdProducto;IdOrnamental" Theme="Office2010Silver"
        ClientInstanceName="gridProductos" OnRowUpdating="gridProductos_RowUpdating" meta:resourcekey="gridProductosResource1">
        <SettingsText Title="Seleccione los productos que ofrece" />
        <Styles>
            <TitlePanel Font-Bold="True" Font-Size="9pt" HorizontalAlign="Left" ForeColor="#CC3300"></TitlePanel>
        </Styles>
        <SettingsDataSecurity AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="NombreTipoProducto" GroupIndex="0" Name="NombreTipoProducto"
                ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="NombreProducto" Name="NombreProducto" VisibleIndex="3" ReadOnly="True" meta:resourcekey="GridViewDataTextColumnResource2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Marque" FieldName="Seleccionado" Name="Seleccionado" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px" meta:resourcekey="GridViewDataCheckColumnResource1">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="Estacionalidad" FieldName="Estacionalidad" Name="Estacionalidad" VisibleIndex="4" meta:resourcekey="GridViewDataTextColumnResource3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Capacidad prod. mensual" FieldName="CapacidadPorMes" Name="CapacidadPorMes" VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing Mode="Batch" NewItemRowPosition="Bottom">
            <BatchEditSettings EditMode="Row" StartEditAction="Click" ShowConfirmOnLosingChanges="False" />
        </SettingsEditing>
        <Settings ShowGroupPanel="False" GroupFormat="{1} {2}" VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" />
        <SettingsBehavior AllowFixedGroups="True" AutoExpandAllGroups="True" />
        <SettingsCommandButton>
            <NewButton ButtonType="Image" RenderMode="Image" Text="Nuevo Producto">
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
            <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            <ClearFilterButton>
                <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
            </ClearFilterButton>
        </SettingsCommandButton>
        <ClientSideEvents EndCallback="endCallback" RowCollapsing="onUpdate" RowExpanding="onUpdate" />
        <SettingsPager PageSize="50" Mode="ShowAllRecords" ShowEmptyDataRows="True"></SettingsPager>
    </dx:ASPxGridView>
</div>