unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus;


type
  TesteRecordType = Record
    nome : String[30];
    idade : Integer;

  End;
type
  TForm1 = class(TForm)
    gridDados: TDBGrid;
    qrDados: TADOQuery;
    dsDados: TDataSource;
    btCampo: TButton;
    cbbCampos: TComboBox;
    edtValor: TEdit;
    btBuscar: TButton;
    BtFiltrar: TButton;
    BtLocalizar: TButton;
    Label1: TLabel;
    mmSql: TMemo;
    tbDados: TADOTable;
    mmBuscar: TMemo;
    cbbTipo: TComboBox;
    Button1: TButton;
    procedure btCampoClick(Sender: TObject);
    procedure mmSqlChange(Sender: TObject);
    procedure BtLocalizarClick(Sender: TObject);
    procedure BtFiltrarClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btBuscarClick(Sender: TObject);
var
  i : Integer;
begin
  qrDados.Active := False;
  qrDados.SQL.Clear;

  qrDados.SQL.Add(mmSql.Lines.Text + 'WHERE ' + cbbCampos.Text +' = ''' + edtValor.Text+ '''');

  mmBuscar.Lines.Text := qrDados.SQL.Text;

  qrDados.SQL.Add(mmBuscar.Lines.Text);

  qrDados.Active := True;
end;

procedure TForm1.btCampoClick(Sender: TObject);
var
  i : Integer;
begin
  qrDados.Active := False;
  qrDados.Active := True;

  cbbCampos.Clear;

  for i := 0 to qrDados.Fields.Count -1 do
  begin
    cbbCampos.Items.Add(qrDados.Fields[i].FieldName);

    if (qrDados.Fields[i].DataType = ftString) or
      (qrDados.Fields[i].DataType = ftWideString)then
    begin
      cbbTipo.Items.Add('String');
    end
    else
    begin
      cbbTipo.Items.Add('Outros');
    end;
  end;
end;
    

procedure TForm1.BtFiltrarClick(Sender: TObject);
begin
  qrDados.Active := False;
  qrDados.SQL.Clear;

  qrDados.SQL.Add(mmSql.Lines.Text + 'WHERE ' + cbbCampos.Text +' LIKE ''%' + edtValor.Text+ '%''');

  mmBuscar.Lines.Text := qrDados.SQL.Text;

  qrDados.SQL.Add(mmBuscar.Lines.Text);

  qrDados.Active := True;
end;

procedure TForm1.BtLocalizarClick(Sender: TObject);
var
  i : Integer;
begin
  qrDados.Locate(cbbCampos.Text, edtValor.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  qrDados.Active := False;
  qrDados.SQL.Clear;

  qrDados.SQL.Add(mmSql.Lines.Text);

  edtValor.Clear;

  qrDados.Active := True;
end;

procedure TForm1.mmSqlChange(Sender: TObject);
begin
  with  qrDados do
  begin
    Close;
    SQL.Clear;
    SQL.Add(mmSql.Lines.Text);
  end;
end;

end.
