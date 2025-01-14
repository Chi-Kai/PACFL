for trial in 1
do
    dir='../save_results/cfl/noniid-labeldir/cifar10'
    if [ ! -e $dir ]; then
    mkdir -p $dir
    fi 
    
    python ../main_per_fedavg.py --trial=$trial \
    --rounds=20 \
    --num_users=100 \
    --frac=0.1 \
    --local_ep=10 \
    --local_bs=10 \
    --lr=0.01 \
    --momentum=0.5 \
    --model=simple-cnn\
    --dataset=cifar10 \
    --datadir='../../data/' \
    --logdir='../../logs/' \
    --savedir='../save_results/' \
    --partition='noniid-labeldir' \
    --alg='per_fedavg' \
    --beta=0.1 \
    --local_view \
    --noise=0 \
    --cluster_alpha=0.4 \
    --nclasses=10 \
    --nsamples_shared=2500 \
    --gpu=0 \
    --print_freq=10 \
    2>&1 | tee $dir'/'$trial'.txt'

done 
