for file in plaintext/*.* ; do
 
  eadid_json=$(grep -oP '"ead_id":"\K([^"]+)' "$file");
  
  eadid_xml=$(grep -oP '<eadid[^>]+>\K([^<]+)' "$file");
  #extension=$(echo "$file" | grep -oP '.+\.\K([a-z]+)$');
  filename_pattern='^[0-9]+\.(json|xml)';
  file_pattern_match=$(echo "$file" | egrep 'plaintext\/[0-9]+\.(json|xml)');
  echo "$file"
  echo "$file_pattern_match"
  if [[ ! -z "$file_pattern_match" ]]; then
          if [ ! -z "$eadid_json" ]; then
         
                #new_filename="UA069.001.DO.${eadid}.archival.${extension}";
                new_filename="UA069.001.DO.${eadid_json}.archival.json";

                echo "$new_filename"
                #pattern='[0-9]+\.json';
                json_pattern='[0-9]+\.json';
                if [[ $file =~ $pattern ]]; then
         
                  sudo mv $file plaintext/$new_filename;
          
         
                fi;
          elif [ ! -z "$eadid_xml" ]; then

                new_filename="UA069.001.DO.${eadid_xml}.archival.xml";

                echo "$new_filename"
                #pattern='[0-9]+\.json';
                xml_pattern='[0-9]+\.xml';
                if [[ $file =~ $pattern ]]; then
         
                  sudo mv $file plaintext/$new_filename;
          
          
                fi;
          
          
     fi;
  
  else
  
    break
  
  fi;
done
