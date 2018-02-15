<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FormCertificacion.aspx.cs" Inherits="Connecting.Web.FormCertificacion" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v16.1, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-envolver-pagina">
        
        <div class="form-titulo-principal"><span>Catalogo de Certificaciones</span></div>

        <dx:ASPxGridView ID="grid" runat="server" KeyFieldName="IdCertificacion" Width="100%" AutoGenerateColumns="False" OnRowDeleting="grid_RowDeleting" OnRowInserting="grid_RowInserting" OnRowUpdating="grid_RowUpdating">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="10" Width="30px" ButtonType="Image"
                    Caption="Nuevo" ShowNewButtonInHeader="True" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn ButtonType="Image" Caption="Borrar"
                    ShowDeleteButton="True" VisibleIndex="11" Width="30px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Certificación" FieldName="NombreCertificacion" VisibleIndex="1">
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
            <SettingsText Title="Salon" />
            <SettingsPopup>
                <EditForm Width="550px" Modal="True" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="true" />
            <SettingsPager PageSize="25"></SettingsPager>
        </dx:ASPxGridView>
    </div>
</asp:Content>
