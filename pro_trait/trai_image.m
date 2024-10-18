function varargout = trai_image(varargin)
% TRAI_IMAGE MATLAB code for trai_image.fig
%      TRAI_IMAGE, by itself, creates a new TRAI_IMAGE or raises the existing
%      singleton*.
%
%      H = TRAI_IMAGE returns the handle to a new TRAI_IMAGE or the handle to
%      the existing singleton*.
%
%      TRAI_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAI_IMAGE.M with the given input arguments.
%
%      TRAI_IMAGE('Property','Value',...) creates a new TRAI_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trai_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trai_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trai_image

% Last Modified by GUIDE v2.5 29-Feb-2024 21:07:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trai_image_OpeningFcn, ...
                   'gui_OutputFcn',  @trai_image_OutputFcn, ...
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


% --- Executes just before trai_image is made visible.
function trai_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trai_image (see VARARGIN)

% Choose default command line output for trai_image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trai_image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trai_image_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global im
[path,user_cancel]=imgetfile();
if user_cancel
    msgbox(sprintf('error'),'ERROR','ERROR');
    return
end
    set(handles.edit1, 'String' , path);
im=imread(path);
setappdata(0, 'im', path); 
axes(handles.axes1);
imshow(im);


  [height, width, ~] = size(im);
   set(handles.text1, 'String', sprintf('Taille de l''image : %d x %d pixels', width, height));


 



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    global im
    ima = im ;
            angle_str = get(handles.edit2, 'String');
            angle = str2double(angle_str);
            if ~isnan(angle)
                rotation = imrotate(ima, angle);
                   axes(handles.axes2);
                    imshow ( rotation);
            else
                msgbox('Veuillez entrer un angle valide.', 'Erreur', 'error');
            end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
 global im
 
            image_inverse = imcomplement(im);
             axes(handles.axes2);
        imshow (image_inverse);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global im; 
            bloc_image = imcrop(im);
            figure('Name', 'bloc d''image');
            imshow(bloc_image);
     


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
 global im
        axes(handles.axes2);
        imhist(im);
        title('Histogramme de l''image');
        xlabel('Niveaux de gris');
        ylabel('Nombre de pixels');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
  global im
  axes(handles.axes1);
        [x, y] = ginput(2);  
       set(handles.text4,'String',x)
       set(handles.text5,'String',y)
        if length(x) ~= 2 || length(y) ~= 2
            msgbox('Sélectionnez deux points pour définir la ligne.', 'Erreur', 'error');
            return;
        end
        
      profil_intensite = improfile(im, x, y);
        
        % Afficher le profil d'intensité
        axes(handles.axes2);
        plot(profil_intensite);
        title('Profil d''intensité de la ligne sélectionnée');
        xlabel('Position le long de la ligne');
        ylabel('Intensité');
    


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
 global im
            pixel_str = get(handles.edit3, 'String');
            pixel_val = str2double(pixel_str);
            if ~isnan(pixel_val)
              masque = ( im == pixel_val);
              axes(handles.axes2);
              imshow(masque);
            else
                msgbox('Veuillez entrer un pixel value valide.', 'Erreur', 'error');
            end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global im ;
global image_bruitee
noise_type_id = get(handles.popupmenu1, 'Value');
        noise_types = {'salt & pepper', 'gaussian'};
        select_bruit = noise_types{noise_type_id};

        % les valeurs de moyenne et de variance
        m = str2double(get(handles.edit4, 'String'));
        v = str2double(get(handles.edit5, 'String'));

        % Ajouter le bruit à l'image
        if strcmp(select_bruit, 'salt & pepper')
            image_bruitee = imnoise( im, 'salt & pepper');
        else
           image_bruitee= imnoise(im,'gaussian',m,v) ;
        end

        % Afficher l'image bruitée
        axes(handles.axes3);
              imshow(image_bruitee);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global image_bruitee
global image_filter
  filter_type_id = get(handles.popupmenu2, 'Value');
   filter_types = {'average', 'median'};
        selected_filter = filter_types{filter_type_id};
        filter_sizes = [3, 5, 7, 9];
        select_filter_size = filter_sizes(get(handles.popupmenu3, 'Value'));

        % Appliquer le filtre à l'image
       if strcmp(selected_filter, 'average') % Filtre Moyen
            h = fspecial('average', [select_filter_size select_filter_size]);
            image_filter = imfilter(image_bruitee, h, 'replicate');
        else  % Filtre Médian
            image_filter = medfilt2(image_bruitee, [select_filter_size select_filter_size]);
        end
         axes(handles.axes4);
              imshow(image_filter);



% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
global im
global image_bruitee
psnrValue = psnr(image_bruitee, im);
set(handles.text2,'string',psnrValue );


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
global im
  px= str2double(inputdlg('Donner le pixel :', 'Gray Value'));
ima_vect = im(:);
% Calculer le nombre d'occurrences de x dans la matrice de l'image
nbre_occurrences = (sum( ima_vect== px));

% Afficher le nombre d'occurrences
set(handles.text3,'String',nbre_occurrences)


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
 axes(handles.axes4);
global im ;
  filterh_type_id = get(handles.popupmenu3, 'Value');
   filterh_types = {'Sobel', 'Roberts', 'Prewitt', 'laplacian'};
        selected_filterh = filterh_types{filterh_type_id};

        % Appliquer le filtre à l'image
       if strcmp(selected_filterh, 'Sobel')
                  j = fspecial('Sobel');
           filtered_Img=  imfilter(im ,j);
           title ('output of Sobel filter')
       elseif   strcmp(selected_filterh, 'Roberts')
                    i = fspecial('Roberts');
           filtered_Img=  imfilter(im ,i);
           title ('output of Roberts filter')
       elseif   strcmp(selected_filterh, 'Prewitt')
                  f = fspecial('Prewitt');
           filtered_Img=  imfilter(im ,f);
      title ('output of Prewitt filter')
       else
            k = fspecial('laplacian');
           filtered_Img=  imfilter(im ,k );
      title ('output of Laplacian filter')
       end
        
        
              imshow(filtered_Img);


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
