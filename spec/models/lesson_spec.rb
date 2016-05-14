RSpec.describe Lesson, type: :model do
	it 'has a factory' do
		expect(FactoryGirl.create(:lesson)).to be_valid
	end

	it 'is invalid without a "author"' do
		expect(FactoryGirl.build(:lesson, author: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, author: '')).to_not be_valid
	end

	it 'is invalid without a body' do
		expect(FactoryGirl.build(:lesson, body: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, body: '')).to_not be_valid
	end

	it 'is invalid without a url' do
		expect(FactoryGirl.build(:lesson, url: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, url: '')).to_not be_valid
	end

	it 'is invalid without a title' do
		expect(FactoryGirl.build(:lesson, title: nil)).to_not be_valid
		expect(FactoryGirl.build(:lesson, title: '')).to_not be_valid
	end

	it 'is invalid with repeat urls' do 
	#	FactoryGirl.create(:lesson, url:abc )
		lesson1 = FactoryGirl.create(:lesson) # url: "dummyurl")
		expect(FactoryGirl.build(:lesson, url: lesson1.url)).to_not be_valid
	end
	
	it 'is invalid with repeat title+creator' do 
		lesson3 = FactoryGirl.create(:lesson) #, title: "mylesson")
		expect(FactoryGirl.build(:lesson, title: lesson3.title, author: lesson3.author)).to_not be_valid
	end
	
	it 'returns descriptive error messages' do 
		# Error message for duplicate urls
		lesson1 = FactoryGirl.create(:lesson)
		lesson2 = FactoryGirl.build(:lesson, url: lesson1.url)
		lesson2.save
		lesson3 = FactoryGirl.build(:lesson, title: lesson1.title, author: lesson1.author)
		lesson3.save
		lesson4 = FactoryGirl.build(:lesson, title: ' ')
		lesson4.save
		lesson5 = FactoryGirl.build(:lesson, author: ' ')
		lesson5.save
		lesson6 = FactoryGirl.build(:lesson, body: ' ')
		lesson6.save
		lesson7 = FactoryGirl.build(:lesson, url: ' ')
		lesson7.save
		lesson8 = FactoryGirl.build(:lesson, title: nil)
		lesson8.save
		lesson9 = FactoryGirl.build(:lesson, author: nil)
		lesson9.save
		lesson10 = FactoryGirl.build(:lesson, body: nil)
		lesson10.save
		lesson11 = FactoryGirl.build(:lesson, url: nil)
		lesson11.save
		
		expect(lesson2.errors.messages[:url][0]).to eql("This url has already been taken!")
		expect(lesson3.errors.messages[:title][0]).to eql("Another entry by the author already exists!")
		expect(lesson4.errors.messages[:title][0]).to eql("Empty entry not allowed")
		expect(lesson5.errors.messages[:author][0]).to eql("Empty entry not allowed")
		expect(lesson6.errors.messages[:body][0]).to eql("Empty entry not allowed")
		expect(lesson7.errors.messages[:url][0]).to eql("Empty entry not allowed")
		expect(lesson8.errors.messages[:title][0]).to eq("Empty entry not allowed")
		expect(lesson9.errors.messages[:author][0]).to eq("Empty entry not allowed")
		expect(lesson10.errors.messages[:body][0]).to eq("Empty entry not allowed")
		expect(lesson11.errors.messages[:url][0]).to eq("Empty entry not allowed")
	end
end
