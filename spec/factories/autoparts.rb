FactoryGirl.define do
  factory :autopart do
    part_number   'some part_number'
    made_by       'some one made'
    car_brand     'some brand'
    model         'some model'
    name          'some name'
    count         2
    price         400.2
    sae           'some sae'
    specification 'some specification'
    description   'some description'
    type          'Autopart'
  end

end