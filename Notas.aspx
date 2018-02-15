<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="Connecting.Web.Notas" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .dxbButton span {
            text-decoration: none;
        }
    </style>

    <div class="form-envolver-pagina">
        <div class="form-titulo-principal"><span>Creación de notas</span></div>

        <div style="clear: both;">
            <div style="float: left; padding-left: 30px; padding-bottom: 10px">
                <dx:ASPxLabel ID="lblEmpresa" runat="server" Text="" Font-Bold="True" Font-Size="10pt" ForeColor="#666666">
                </dx:ASPxLabel>
            </div>
            <div style="float: right">
                <dx:ASPxButton ID="btnRegresar" runat="server" Text="Regresar" RenderMode="Link" ForeColor="Black" Font-Underline="False" OnClick="btnRegresar_Click">
                    <Image Url="~/IMG/Regresar.png">
                    </Image>
                </dx:ASPxButton>
            </div>
        </div>

        <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdNota" Width="100%" Theme="Moderno" AutoGenerateColumns="False"
            OnRowInserting="grid_RowInserting" ClientInstanceName="grid" OnAfterPerformCallback="grid_AfterPerformCallback">
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" />
            <SettingsText PopupEditFormCaption="Ingreso de Nota" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="10" Width="100px" ButtonType="Image"
                    Caption="Nuevo" ShowNewButtonInHeader="True" ShowEditButton="False">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataDateColumn Caption="Fecha" FieldName="FechaIngresa" VisibleIndex="7" Width="100px">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Descripción" FieldName="Descripcion" Name="Descripcion" VisibleIndex="8">
                    <PropertiesMemoEdit Height="300px">
                        <ValidationSettings>
                            <RequiredField ErrorText="Requerido" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings CaptionLocation="Top" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="Usuario" FieldName="UsuarioIngresa" VisibleIndex="9" Name="Usuario" Width="100px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsCommandButton>
                <NewButton RenderMode="Button" Text="Nueva">
                    <Image Url="~/IMG/Nuevo.png"></Image>
                </NewButton>
                <UpdateButton RenderMode="Button" Text="Aceptar">
                </UpdateButton>
                <CancelButton RenderMode="Button" Text="Cancelar">
                </CancelButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <ClearFilterButton>
                    <Image Url="~/IMG/LimpiarBusqueda.png"></Image>
                </ClearFilterButton>
            </SettingsCommandButton>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" />
            <SettingsPager PageSize="15"></SettingsPager>
        </dx:ASPxGridView>

        <dx:ASPxLabel ID="lblError" runat="server" Text="" ForeColor="red" EnableViewState="False"></dx:ASPxLabel>
    </div>

</asp:Content>
