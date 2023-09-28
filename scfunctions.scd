~rndBreak = {
	arg number, max=number; // max size
	var subsizes = List.new;
	var rnd;
	while {number > 0} {
		rnd = 1.rrand([number, max].minItem);
		subsizes.add(rnd);
		number = number - rnd;
	};
	subsizes;
};

~lcmNums = {
	arg nums;
	var tmpLcm = nums[0].lcm(nums[1]);
	var idx = 2;
	while {idx < nums.size} {
		tmpLcm = tmpLcm.lcm(nums[idx]);
		idx = idx + 1;
	};
	tmpLcm
};

~grpBySz = {
	arg items, sizes;
	var idx=0, idxlist, nextidx;
	sizes = sizes.insert(0, 0);
	idxlist = sizes.collect {
		arg i;
		idx = idx + i;
	};
	idxlist[..(idxlist.size-2)].collect {
		arg idx, i;
		nextidx = idxlist[i + 1];
		items[idx..nextidx-1]
	}
};