-- BATCH 18 | BAND 1.0 | TOPIC: Travel | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Travel' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Travel',
       'Từ vựng IELTS chủ đề Travel cho Band 1: chuyến đi, hành lý, giấy tờ và đặt chỗ cơ bản.',
       'easy', true, 'teal')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Travel' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'travel', 'đi du lịch', 'to go from one place to another', 'verb', '/ˈtrævl/',
     'I like to travel with my family.', 'Tôi thích đi du lịch cùng gia đình.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['travel abroad', 'travel by train', 'travel alone'],
     array['journey', 'tour'],
     array['stay'],
     array['traveller', 'travelling', 'traveler'],
     'Cũng là danh từ: air travel, không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'trip', 'chuyến đi', 'a short journey to a place', 'noun', '/trɪp/',
     'We take a trip to the sea every summer.', 'Chúng tôi đi một chuyến đến biển mỗi mùa hè.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 2 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['go on a trip', 'school trip', 'day trip'],
     array['excursion', 'outing'],
     array[]::text[],
     array['tripper'],
     'Take a trip / go on a trip đều dùng được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'journey', 'hành trình', 'the act of travelling from one place to another', 'noun', '/ˈdʒɜːrni/',
     'The journey takes two hours by bus.', 'Hành trình mất hai giờ đi xe buýt.',
     1.0, 'Travel', 'A1', 'Speaking Part 2 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['long journey', 'make a journey', 'bus journey'],
     array['trip', 'voyage'],
     array[]::text[],
     array['journeys'],
     'Journey nhấn về quãng đường, trip nhấn về cả chuyến đi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'holiday', 'kỳ nghỉ', 'a time away from work or school', 'noun', '/ˈhɑːlədeɪ/',
     'We go on holiday in July.', 'Chúng tôi đi nghỉ vào tháng Bảy.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 2 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['go on holiday', 'summer holiday', 'on holiday'],
     array['vacation'],
     array['work'],
     array['holidays', 'holidaymaker'],
     'Anh-Anh dùng holiday, Anh-Mỹ dùng vacation.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ticket', 'vé', 'a paper or card that lets you travel or enter a place', 'noun', '/ˈtɪkɪt/',
     'I buy a train ticket at the station.', 'Tôi mua vé tàu ở nhà ga.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Booking).',
     array['Speaking', 'Listening'],
     array['buy a ticket', 'book a ticket', 'plane ticket'],
     array['pass'],
     array[]::text[],
     array['ticketing'],
     'Return ticket là vé khứ hồi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'passport', 'hộ chiếu', 'an official paper for travelling to other countries', 'noun', '/ˈpæspɔːrt/',
     'Do not forget your passport.', 'Đừng quên hộ chiếu của bạn.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening'],
     array['show a passport', 'valid passport', 'passport control'],
     array[]::text[],
     array[]::text[],
     array['pass', 'port'],
     'Passport control là kiểm soát hộ chiếu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'luggage', 'hành lý', 'bags and cases that you take when you travel', 'noun', '/ˈlʌɡɪdʒ/',
     'My luggage is very heavy.', 'Hành lý của tôi rất nặng.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening'],
     array['carry luggage', 'heavy luggage', 'luggage room'],
     array['baggage'],
     array[]::text[],
     array['luggage cart'],
     'Không đếm được: a piece of luggage.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'suitcase', 'va li', 'a large bag for carrying clothes when you travel', 'noun', '/ˈsuːtkeɪs/',
     'I put my clothes in a big suitcase.', 'Tôi để quần áo vào một chiếc va li lớn.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening'],
     array['pack a suitcase', 'big suitcase', 'carry a suitcase'],
     array['case'],
     array[]::text[],
     array['suit', 'case'],
     'Pack a suitcase là xếp va li.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'map', 'bản đồ', 'a picture that shows where places are', 'noun', '/mæp/',
     'We use a map to find the hotel.', 'Chúng tôi dùng bản đồ để tìm khách sạn.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['read a map', 'city map', 'on the map'],
     array['chart'],
     array[]::text[],
     array['mapping'],
     'Cũng là động từ: map out a plan.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hotel', 'khách sạn', 'a place where you pay to stay', 'noun', '/hoʊˈtel/',
     'Our hotel is near the beach.', 'Khách sạn của chúng tôi gần bãi biển.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['stay at a hotel', 'book a hotel', 'hotel room'],
     array['inn'],
     array[]::text[],
     array['hotelier'],
     'Stay at a hotel là ở khách sạn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'airport', 'sân bay', 'a place where planes take off and land', 'noun', '/ˈerpɔːrt/',
     'We arrive at the airport early.', 'Chúng tôi đến sân bay sớm.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['at the airport', 'airport bus', 'international airport'],
     array['airfield'],
     array[]::text[],
     array['air', 'port'],
     'At the airport là cụm giới từ chuẩn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'reservation', 'sự đặt chỗ', 'an arrangement to keep a room or table for you', 'noun', '/ˌrezərˈveɪʃn/',
     'I make a reservation at the hotel.', 'Tôi đặt phòng ở khách sạn.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Booking).',
     array['Speaking', 'Listening'],
     array['make a reservation', 'hotel reservation', 'cancel a reservation'],
     array['booking'],
     array[]::text[],
     array['reserve', 'reserved'],
     'Anh-Anh hay dùng booking hơn reservation.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pack', 'đóng gói', 'to put things in a bag or case', 'verb', '/pæk/',
     'I pack my clothes the night before.', 'Tôi xếp quần áo vào đêm trước.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening'],
     array['pack a bag', 'pack a suitcase', 'pack up'],
     array['prepare'],
     array['unpack'],
     array['package', 'packing', 'unpack'],
     'Unpack là dỡ đồ ra.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'leave', 'rời đi', 'to go away from a place', 'verb', '/liːv/',
     'We leave the hotel at eight.', 'Chúng tôi rời khách sạn lúc tám giờ.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening'],
     array['leave early', 'leave home', 'leave for'],
     array['depart'],
     array['arrive'],
     array['left', 'leaving', 'departure'],
     'Quá khứ là left.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'arrive', 'đến nơi', 'to reach a place', 'verb', '/əˈraɪv/',
     'We arrive in Hanoi at noon.', 'Chúng tôi đến Hà Nội vào buổi trưa.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening'],
     array['arrive at', 'arrive in', 'arrive late'],
     array['reach'],
     array['leave', 'depart'],
     array['arrival', 'arrived'],
     'Arrive at cho nơi nhỏ, arrive in cho thành phố hoặc nước.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'plan', 'kế hoạch, lên kế hoạch', 'to decide what you will do', 'verb', '/plæn/',
     'We plan a trip to the mountains.', 'Chúng tôi lên kế hoạch cho một chuyến đi lên núi.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['plan a trip', 'make a plan', 'plan ahead'],
     array['arrange', 'organise'],
     array[]::text[],
     array['planner', 'planning', 'planned'],
     'Cũng là danh từ: a travel plan.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'abroad', 'ở nước ngoài', 'in or to another country', 'adverb', '/əˈbrɔːd/',
     'I want to study abroad.', 'Tôi muốn du học ở nước ngoài.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['go abroad', 'live abroad', 'study abroad'],
     array['overseas'],
     array['at home'],
     array['broad'],
     'Abroad không đi với to: go abroad.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'country', 'đất nước', 'an area with its own government', 'noun', '/ˈkʌntri/',
     'I want to visit another country.', 'Tôi muốn thăm một đất nước khác.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['foreign country', 'my country', 'another country'],
     array['nation'],
     array[]::text[],
     array['countryside'],
     'Country còn là vùng nông thôn: in the country.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'foreign', 'nước ngoài', 'from or in another country', 'adjective', '/ˈfɔːrən/',
     'I like meeting foreign people.', 'Tôi thích gặp người nước ngoài.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['foreign country', 'foreign language', 'foreign visitor'],
     array['overseas'],
     array['local', 'native'],
     array['foreigner', 'foreignness'],
     'Foreign language là ngoại ngữ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'souvenir', 'quà lưu niệm', 'something you buy to remember a place', 'noun', '/ˌsuːvəˈnɪr/',
     'I buy souvenirs for my family.', 'Tôi mua quà lưu niệm cho gia đình.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 2 (Travel).',
     array['Speaking', 'Listening'],
     array['buy a souvenir', 'souvenir shop', 'small souvenir'],
     array['memento'],
     array[]::text[],
     array['souvenirs'],
     'Souvenir shop là cửa hàng bán quà lưu niệm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'destination', 'điểm đến', 'the place where you are going', 'noun', '/ˌdestɪˈneɪʃn/',
     'Da Nang is a popular destination.', 'Đà Nẵng là một điểm đến phổ biến.',
     1.0, 'Travel', 'A1', 'Speaking Part 2 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['popular destination', 'tourist destination', 'final destination'],
     array[]::text[],
     array[]::text[],
     array['destined', 'destiny'],
     'Tourist destination là điểm đến du lịch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stay', 'ở lại', 'to remain in a place', 'verb', '/steɪ/',
     'We stay in a small hotel.', 'Chúng tôi ở trong một khách sạn nhỏ.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['stay at', 'stay in', 'stay for a week'],
     array['remain', 'live'],
     array['leave'],
     array['stayed', 'staying'],
     'Stay at + nơi cụ thể, stay in + thành phố.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'return', 'trở về', 'to come or go back', 'verb', '/rɪˈtɜːrn/',
     'We return home on Sunday.', 'Chúng tôi trở về nhà vào Chủ nhật.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['return home', 'return ticket', 'return trip'],
     array['come back'],
     array['leave'],
     array['returned', 'returnable'],
     'Return ticket là vé khứ hồi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'adventure', 'cuộc phiêu lưu', 'an exciting or unusual experience', 'noun', '/ədˈventʃər/',
     'The trip is a great adventure.', 'Chuyến đi là một cuộc phiêu lưu tuyệt vời.',
     1.0, 'Travel', 'A1', 'Speaking Part 2 (Experiences).',
     array['Speaking', 'Listening', 'Writing'],
     array['go on an adventure', 'great adventure', 'adventure holiday'],
     array['expedition'],
     array[]::text[],
     array['adventurous', 'adventurer'],
     'Adventurous mô tả người thích khám phá.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'visa', 'thị thực', 'an official paper that lets you enter a country', 'noun', '/ˈviːzə/',
     'I need a visa to visit that country.', 'Tôi cần thị thực để thăm nước đó.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening', 'Reading'],
     array['apply for a visa', 'tourist visa', 'visa application'],
     array['permit'],
     array[]::text[],
     array['visas'],
     'Apply for a visa là xin thị thực.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'customs', 'hải quan', 'the place where bags are checked at a border', 'noun', '/ˈkʌstəmz/',
     'We go through customs at the airport.', 'Chúng tôi làm thủ tục hải quan ở sân bay.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening'],
     array['go through customs', 'customs officer', 'customs check'],
     array['border control'],
     array[]::text[],
     array['custom', 'customary'],
     'Customs luôn ở số nhiều khi nói về hải quan.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'departure', 'khởi hành', 'the act of leaving a place', 'noun', '/dɪˈpɑːrtʃər/',
     'The departure time is ten o''clock.', 'Giờ khởi hành là mười giờ.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening', 'Reading'],
     array['departure time', 'departure gate', 'flight departure'],
     array['leaving'],
     array['arrival'],
     array['depart', 'departed'],
     'Departure gate là cổng khởi hành.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'backpack', 'ba lô', 'a bag that you carry on your back', 'noun', '/ˈbækpæk/',
     'I travel with a small backpack.', 'Tôi đi du lịch với một chiếc ba lô nhỏ.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening'],
     array['carry a backpack', 'heavy backpack', 'travel backpack'],
     array['rucksack'],
     array[]::text[],
     array['backpacker', 'backpacking'],
     'Backpacker là người du lịch bụi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'timetable', 'thời gian biểu, lịch trình', 'a list of times when buses or trains leave', 'noun', '/ˈtaɪmteɪbl/',
     'Check the train timetable before you go.', 'Hãy xem lịch tàu trước khi đi.',
     1.0, 'Travel', 'A1', 'Listening Section 1 (Transport).',
     array['Speaking', 'Listening', 'Reading'],
     array['bus timetable', 'train timetable', 'check the timetable'],
     array['schedule'],
     array[]::text[],
     array['timetables'],
     'Anh-Mỹ hay dùng schedule.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'explore', 'khám phá', 'to travel around a place to learn about it', 'verb', '/ɪkˈsplɔːr/',
     'We explore the old town on foot.', 'Chúng tôi đi bộ khám phá khu phố cổ.',
     1.0, 'Travel', 'A1', 'Speaking Part 1 and Part 2 (Travel).',
     array['Speaking', 'Listening', 'Writing'],
     array['explore a city', 'explore new places', 'explore on foot'],
     array['discover', 'investigate'],
     array[]::text[],
     array['exploration', 'explorer', 'exploratory'],
     'Explore + địa điểm, không dùng giới từ.')
  on conflict do nothing;

end $$;
