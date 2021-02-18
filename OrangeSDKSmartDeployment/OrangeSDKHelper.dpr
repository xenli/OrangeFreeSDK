program OrangeSDKHelper;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  VCL.Dialogs,
  uBaseLog_Copy,
  System.SysUtils,
  uOrangeUISmartSDKDeployment in 'uOrangeUISmartSDKDeployment.pas',
  uCommandLineHelper in 'uCommandLineHelper.pas';


var
  I:Integer;
  AParams:String;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    //��������еĲ���
//    ParamStr(0);
//    ShowMessage(ParamStr(0)+' '+ParamStr(1));
    AParams:='';
    for I := 0 to ParamCount-1 do
    begin
      AParams:=AParams+ParamStr(I)+' ';
    end;



    //ShowMessage('Hello');

    //��¼��־
    uBaseLog_Copy.GetGlobalLog.IsWriteLog:=True;
    uBaseLog_Copy.HandleException(nil,AParams);



    //"C:\OrangeFreeSDK\OrangeSDKSmartDeployment\Win32\Debug\OrangeSDKSmartDeployCommand.exe" $(PROJECTPATH) -C $(Config)

    if FileExists(ParamStr(1)) then
    begin
      GenerateProject_R_Java_Jar(
                                ParamStr(1),
      //                          'C:\OrangeFreeSDK\AndroidͼƬ��Ƶѡ����DVMediaSelector_V1_0_0\TestDVMediaSelector.dproj',
                                'Android',
                                '21.0',
                                GlobalCommandLineOutputHelper.DoGetCommandLineOutput
                                );
    end;


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.