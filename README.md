@jayakumar


# Text-Recognition-OCR
Training new TR model using Tesseract OCR engine 5.2 with new fonts.

# Tesseract OCR

This project is based on Tesseract OCR -5.2 

We can add new fonts and train the model for text recognition on image or PDF with best accuracy.

We are using current best lstm eng model as a base model. 

Please use official tesseract repo for setup and change the requirements using this repo for further training and testing.




For Loading Pages
Give the font name in fontlist argument and also Give the directory name at output_dir train/which is you are created in the path "tesseract-5.2.0-rc1/train/"


sudo src/training/tesstrain.sh --fonts_dir /usr/local/share/fonts --fontlist  'Digital-7 mono' 'Vitali slab fat, Regular' 'Falling sky, Bold' --lang eng --linedata_only --langdata_dir langdata_lstm  --training_text ./digits_printed.txt  --tessdata_dir tessdata --save_box_tiff --maxpages 500000 --output_dir train/Directory_name

# Installation and Training 
RUN ./autogen.sh

RUN ./configure --enable-debug

RUN make

RUN make install

RUN ldconfig

RUN make training

RUN make training-install

RUN apt install python3-pip 

RUN cp ./fonts/* /usr/local/share/fonts/

RUN chmod +x /ocr/Training/auto.old.sh

ENV TESSDATA_PREFIX=/ocr/Training/tessdata

ENTRYPOINT ["/ocr/Training/auto.old.sh"]

