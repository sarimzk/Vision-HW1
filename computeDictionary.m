% Computes filter bank and dictionary, and saves it in dictionary.mat 

function computeDictionary()

	load('C:/Users/sarim/Documents/hw1/release/data/traintest.mat'); 

	interval= 5;
	train_imagenames = train_imagenames(1:interval:end);
	[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['C:/Users/sarim/Documents/hw1/release/data/'],train_imagenames));

	save('C:/Users/sarim/Desktop/dictionary.mat','filterBank','dictionary'); %tweak paths accordingly

end

        