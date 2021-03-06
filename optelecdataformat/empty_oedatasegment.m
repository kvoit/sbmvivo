function d = empty_oedatasegment
oedatasegment_version = get_oedatasegment_version();
%all numeric types are double except f, t and mask.
%to calculate final f and t values, we do a cast to double, multiply by the scale factor, then add the offset
d = orderfields(struct( ...
    'version', oedatasegment_version ...
    ,'f', zeros(0,1) ... %fluorescence
    ,'f_removed', zeros(0, 1) ...
    ,'f_numerictype', '' ... %matlab type string e.g. double, single, int32, etc.
    ,'f_offset', NaN ...
    ,'f_scale_factor', NaN ...
    ,'f_units', '' ...
    ,'f_mask', false(0,1) ... %indicates which elements of f are valid. necessary since some numeric types don't allow NaN values (e.g. uint8)
    ,'frameindex', zeros(0,1) ... %index of image in movie for each fluorescence measurement. matlab indexing, i.e. first image is one, not zero.
    ,'t', zeros(0,1) ... %time. each element corresponds to a measurement in f
    ,'t_numerictype', '' ... %matlab type string e.g. double, single, int32, etc.
    ,'t_offset', NaN ...
    ,'t_scale_factor', NaN ...
    ,'t_units', '' ...
    ,'t_timescalename', '' ...
    ,'t_timescalezero', '' ... %date/time string indicating roughly when the recording begins.
    ,'timescaleclockrate', NaN ... %Hz
    ,'ephys_samplingrate', NaN ... %Hz
    ,'apcounts', zeros(0,1) ... %counts of APs for each flourescence measurement. apcounts(i) is the number of electrically detected APs between t(i-1) and t(i). apcounts(1) is always NaN.
    ,'spiketimes', zeros(0,1) ... %time of each AP in the same units as t.
    ,'spiketimes_window', NaN(1,2) ... %window indicating when recording of spike times began and ended
    ,'apcounts_present', false, 'spiketimes_present', false ... %indicate whether we have precised spike times, apcounts or both available
    ,'notes', {{}} ...
    ,'image', [] ... %can be 2D or 3D, arbitrary numeric type
    ,'roi', [] ... %binary mask, column vector of indices, or N x 2 list of indices and weights
    ,'roiuid', [] ...
    ,'neuronuid', [] ...
    ,'attributes',{{}} ... %cell array, can contain anything
    ,'attribute_names',{{}} ... %names of each attribute
    ,'info',empty_oedatasegmentinfo ... %imaging parameters
    ,'imagefile','' ... %full path and filename on the filesytem from which the file was imported
    ,'imagefilepartialpath','' .... %path and filename relative to base directory
    ,'ephysfile','' ...
    ,'ephysfilepartialpath','' ...
    ));