root_dir="2018_01_16"
date="2018-01-16"
array_id=(01 02 03 04 05 06 07 08)
array_name=("kawabe" "higashinaka" "yasuda" "kamiya" "ishiyama" "yoshimyura" "aiko" "higashide")
N=8

for idx in `seq 0 $((${N}-1))`;
do
    # Params
    sub_id=${array_id[${idx}]}
    sub_name=${array_name[${idx}]}
    echo Params: ${idx} ${sub_id} ${sub_name}
    # Exe
    python ./src/log_to_adl.py \
    	   --path-input-log   /root/dataStore_upconversion/data/${root_dir}/${sub_id}_${sub_name}/data/log/${sub_id}_${sub_name}.log \
    	   --date             ${date} \
    	   --shift            0.0 \
    	   --path-output-dir  /root/dataStore_upconversion/data/${root_dir}/CSV/ADL/ADL_${sub_id}_${sub_name}/ 
done