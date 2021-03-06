$pathToGitRoot = "C:/Users/Alex/Repositories/Mensural-Detector"
$pathToSourceRoot = "$($pathToGitRoot)/object_detection"
$pathToTranscript = "$($pathToSourceRoot)/transcripts"
cd $pathToSourceRoot

# Make sure that python finds all modules inside this directory
echo "Appending required paths to temporary PYTHONPATH"
$env:PYTHONPATH = "$($pathToGitRoot);$($pathToSourceRoot);$($pathToGitRoot)/slim"

################################################################
# Available configurations - uncomment the one to actually run #
################################################################
# $configuration = "faster_rcnn_inception_resnet_v2_atrous"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale"
$configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_cross_validation"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_0.001_lr"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_0.01_lr"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_0.003_lr_20000_decay"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_adam"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_focal_loss"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_focal_loss2"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_small_scale_focal_loss3"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_small_scale_focal_loss"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_20x29-box-size"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_dim_clust"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_dim_clust2"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_dim_clust3"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_pretrained"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_max_suppr_09"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_max_suppr_03"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_only_rpn"
# $configuration = "ssd_inception_v2"
# $configuration = "ssd_inception_v2_focal_loss"
# $configuration = "ssd_inception_v2_focal_loss_small_anchors"
# $configuration = "ssd_inception_v2_focal_loss_fixed_anchors"

Start-Transcript -path "$($pathToTranscript)/ValidateModel-$($configuration).txt" -append
echo "Validate with $($configuration) configuration"
# python eval.py --logtostderr --pipeline_config_path="$($pathToSourceRoot)/configurations/$($configuration).config" --checkpoint_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-5-train" --eval_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-5-validate"
python eval.py --logtostderr --pipeline_config_path="$($pathToSourceRoot)/configurations/$($configuration).config" --checkpoint_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-4-train" --eval_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-5-validate-weighted"
Stop-Transcript

