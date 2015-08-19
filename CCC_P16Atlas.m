function varargout = CCC_P16Atlas(varargin)
% CCC_P16ATLAS MATLAB code for CCC_P16Atlas.fig
%      CCC_P16ATLAS, by itself, creates a new CCC_P16ATLAS or raises the existing
%      singleton*.
%
%      H = CCC_P16ATLAS returns the handle to a new CCC_P16ATLAS or the handle to
%      the existing singleton*.
%
%      CCC_P16ATLAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CCC_P16ATLAS.M with the given input arguments.
%
%      CCC_P16ATLAS('Property','Value',...) creates a new CCC_P16ATLAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CCC_P16Atlas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CCC_P16Atlas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CCC_P16Atlas

% Last Modified by GUIDE v2.5 17-Aug-2015 20:17:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CCC_P16Atlas_OpeningFcn, ...
                   'gui_OutputFcn',  @CCC_P16Atlas_OutputFcn, ...
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


% --- Executes just before CCC_P16Atlas is made visible.
function CCC_P16Atlas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CCC_P16Atlas (see VARARGIN)


fileFolder = fullfile('Users','claytonccollins','Desktop','Lab Things','ForAtlas');
dirOutput = dir(fullfile(fileFolder, '*.tif'));
fileNames = {dirOutput.name};

handles.pages = zeros(600,800,length(fileNames));

for i = 1:length(fileNames)
    handles.pages(:,:,i) = imread(fileNames{i});
    handles.pages(:,:,i) = handles.pages(:,:,i)/max(max(handles.pages(:,:,i)));
end

imshow(handles.pages(:,:,1));



% Choose default command line output for CCC_P16Atlas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CCC_P16Atlas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CCC_P16Atlas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



set(handles.text2,'WindowButtonMotionFcn',@mouseMove);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

slidepos = get(handles.slider1,'Value');
slidepos = int8(slidepos);
imshow(handles.pages(:,:,slidepos));


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

sliderMin = 1;
sliderMax = 8; 
sliderStep = [.125, .25]; 

set(handles.slider1,'Max',sliderMax);
set(handles.slider1,'Min',sliderMin);
set(handles.slider1,'SliderStep',sliderStep);

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function text2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
