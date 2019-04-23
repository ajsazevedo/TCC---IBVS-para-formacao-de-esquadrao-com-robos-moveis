function fcn=image_features(fc)
fcn=[fc(1,:)./fc(2,:); fc(3,:)./fc(2,:)];