function varargout = ElisiaDwiRahayu_TugasJST(varargin)
% ELISIADWIRAHAYU_TUGASJST MATLAB code for ElisiaDwiRahayu_TugasJST.fig
%      ELISIADWIRAHAYU_TUGASJST, by itself, creates a new ELISIADWIRAHAYU_TUGASJST or raises the existing
%      singleton*.
%
%      H = ELISIADWIRAHAYU_TUGASJST returns the handle to a new ELISIADWIRAHAYU_TUGASJST or the handle to
%      the existing singleton*.
%
%      ELISIADWIRAHAYU_TUGASJST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELISIADWIRAHAYU_TUGASJST.M with the given input arguments.
%
%      ELISIADWIRAHAYU_TUGASJST('Property','Value',...) creates a new ELISIADWIRAHAYU_TUGASJST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ElisiaDwiRahayu_TugasJST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ElisiaDwiRahayu_TugasJST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ElisiaDwiRahayu_TugasJST

% Last Modified by GUIDE v2.5 01-Jun-2021 22:11:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ElisiaDwiRahayu_TugasJST_OpeningFcn, ...
                   'gui_OutputFcn',  @ElisiaDwiRahayu_TugasJST_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ElisiaDwiRahayu_TugasJST is made visible.
function ElisiaDwiRahayu_TugasJST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ElisiaDwiRahayu_TugasJST (see VARARGIN)

% Choose default command line output for ElisiaDwiRahayu_TugasJST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ElisiaDwiRahayu_TugasJST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ElisiaDwiRahayu_TugasJST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angka1=str2double(get(handles.angka1, 'String'));
angka2=str2double(get(handles.angka2, 'String'));
if ((angka1 >= 0 && angka1 <= 1) && (angka2 >= 0 && angka2 <= 1))
    net = newp([0 1; 0 1], 1);
    bobot = [-1 1];
    net.IW{1,1} = bobot;
    bias = [1];
    net.b{1} = bias;
    p = [[1;1] [1;0] [0;1] [0;0]];
    t = [1 1 1 0];
    net = train(net,p,t);
 
    hasil = net([angka1;angka2]);
    
    set(handles.hasil, 'String', hasil);
    set(handles.bobot, 'String', net.IW{1,1});
    set(handles.bias, 'String', net.b{1});
else
    set(handles.hasil, 'String', "Inputan salah!");
    set(handles.bobot, 'String', "Inputan salah!");
    set(handles.bias, 'String', "Inputan salah!");
end


function angka1_Callback(hObject, eventdata, handles)
% hObject    handle to angka1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angka1 as text
%        str2double(get(hObject,'String')) returns contents of angka1 as a double


% --- Executes during object creation, after setting all properties.
function angka1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angka1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angka2_Callback(hObject, eventdata, handles)
% hObject    handle to angka2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angka2 as text
%        str2double(get(hObject,'String')) returns contents of angka2 as a double


% --- Executes during object creation, after setting all properties.
function angka2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angka2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobot1_Callback(hObject, eventdata, handles)
% hObject    handle to bobot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobot1 as text
%        str2double(get(hObject,'String')) returns contents of bobot1 as a double


% --- Executes during object creation, after setting all properties.
function bobot1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bias_Callback(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bias as text
%        str2double(get(hObject,'String')) returns contents of bias as a double


% --- Executes during object creation, after setting all properties.
function bias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bobot_Callback(hObject, eventdata, handles)
% hObject    handle to bobot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bobot as text
%        str2double(get(hObject,'String')) returns contents of bobot as a double


% --- Executes during object creation, after setting all properties.
function bobot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bobot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
