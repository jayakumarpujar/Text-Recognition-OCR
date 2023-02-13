#sudo rm /usr/local/share/tessdata/calorie*
#sudo rm /usr/local/share/tessdata/csv_reports/*.csv

#sudo src/training/tesstrain.sh --fonts_dir /usr/local/share/fonts --fontlist 'Arial, Regular' 'Frutiger Bold, Bold' 'Arial, Bold' 'Calibri, Bold' 'Swis721 BdRnd BT' --lang eng --linedata_only --noextract_font_properties --langdata_dir langdata_lstm  --training_text ./Aadhaar_jan.txt --tessdata_dir tessdata --save_box_tiff --maxpages 100000 --output_dir train/task/
echo "#####################################################################################################################pages loading completed"
sudo lstmtraining --continue_from ./best_lstm/eng.lstm --model_output new_out/ --traineddata tessdata/eng.traineddata --train_listfile ./train/task/eng.training_files.txt --max_iterations 70000 --learning_rate=10e-3
echo "######################################################################################training completed"
for f in new_out/*.checkpoint; do sudo lstmtraining --stop_training --continue_from $f --traineddata tessdata/eng.traineddata --model_output $f;done
for f in new_out/*.checkpoint; do sudo mv -- "$f" "${f%.checkpoint}.traineddata";done
echo "################################################################################converted checkpoints to models"
sudo mv new_out/*.traineddata /usr/local/share/tessdata/calorie/
#sudo rm new_out/_checkpoint
echo "###################################################################models moved to automodels folder in tessdata"
#cd /usr/local/share/tessdata/
#for f  in  /usr/local/share/tessdata/calorie/*; do go run yo1.go ;done
#for f in /usr/local/share/tessdata/calorie/*; do go run yo1.go --lang "${f%.traineddata}";done
#cd csv_reports
#python3 mergecsv.py
#python3 comparecsv.py
#sudo nano Accuracy.txt
#

