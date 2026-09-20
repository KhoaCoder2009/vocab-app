-- BATCH 20 | BAND 1.0 | TOPIC: Transport | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Transport' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Transport',
       'Từ vựng IELTS chủ đề Transport cho Band 1: phương tiện, đường sá và giao thông cơ bản.',
       'easy', true, 'orange')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Transport' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'transport', 'giao thông vận tải', 'a system for moving people or goods', 'noun', '/ˈtrænspɔːrt/',
     'Public transport is cheap in my city.', 'Giao thông công cộng ở thành phố tôi rẻ.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['public transport', 'means of transport', 'transport system'],
     array['transportation'],
     array[]::text[],
     array['transportable'],
     'Anh-Mỹ hay dùng transportation.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bus', 'xe buýt', 'a large vehicle that carries many people', 'noun', '/bʌs/',
     'I take the bus to school.', 'Tôi đi xe buýt đến trường.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['take the bus', 'bus stop', 'bus station'],
     array['coach'],
     array[]::text[],
     array['buses'],
     'Take the bus và go by bus đều dùng được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'train', 'tàu hỏa', 'a long vehicle that runs on rails', 'noun', '/treɪn/',
     'The train is faster than the bus.', 'Tàu hỏa nhanh hơn xe buýt.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['take a train', 'train station', 'catch a train'],
     array['railway'],
     array[]::text[],
     array['trainer', 'training'],
     'Train còn là động từ: train for a race.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'taxi', 'xe taxi', 'a car with a driver that you pay to use', 'noun', '/ˈtæksi/',
     'We take a taxi to the airport.', 'Chúng tôi đi taxi đến sân bay.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['take a taxi', 'call a taxi', 'taxi driver'],
     array['cab'],
     array[]::text[],
     array['taxis'],
     'Anh-Mỹ hay nói cab.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'car', 'ô tô', 'a road vehicle with four wheels', 'noun', '/kɑːr/',
     'My father drives a small car.', 'Bố tôi lái một chiếc ô tô nhỏ.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening', 'Writing'],
     array['drive a car', 'by car', 'car park'],
     array['automobile'],
     array[]::text[],
     array['carriage'],
     'By car là đi bằng ô tô.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bicycle', 'xe đạp', 'a vehicle with two wheels that you ride with your feet', 'noun', '/ˈbaɪsɪkl/',
     'I ride a bicycle to the park.', 'Tôi đạp xe đến công viên.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['ride a bicycle', 'bicycle lane', 'electric bicycle'],
     array['bike'],
     array[]::text[],
     array['cycle', 'cyclist'],
     'Bike là dạng viết ngắn thân mật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'plane', 'máy bay', 'a vehicle that flies in the air', 'noun', '/pleɪn/',
     'The plane leaves at seven.', 'Máy bay cất cánh lúc bảy giờ.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['take a plane', 'plane ticket', 'catch a plane'],
     array['aeroplane'],
     array[]::text[],
     array['airplane'],
     'Anh-Mỹ viết airplane.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ship', 'con tàu', 'a very large boat', 'noun', '/ʃɪp/',
     'The ship sails across the sea.', 'Con tàu chạy qua biển.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['cargo ship', 'big ship', 'by ship'],
     array['vessel'],
     array[]::text[],
     array['shipping', 'shipment'],
     'Cũng là động từ: ship goods.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boat', 'thuyền', 'a small vehicle that travels on water', 'noun', '/boʊt/',
     'We take a boat across the river.', 'Chúng tôi đi thuyền qua sông.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['take a boat', 'fishing boat', 'boat trip'],
     array['vessel'],
     array[]::text[],
     array['boating'],
     'Small boat là thuyền nhỏ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ferry', 'phà', 'a boat that carries people across water', 'noun', '/ˈferi/',
     'We take a ferry to the island.', 'Chúng tôi đi phà ra đảo.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['take a ferry', 'ferry terminal', 'ferry ticket'],
     array[]::text[],
     array[]::text[],
     array['ferries'],
     'Ferry terminal là bến phà.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'subway', 'tàu điện ngầm', 'an underground train system', 'noun', '/ˈsʌbweɪ/',
     'The subway is fast and cheap.', 'Tàu điện ngầm nhanh và rẻ.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['take the subway', 'subway station', 'subway line'],
     array['metro', 'underground'],
     array[]::text[],
     array['sub', 'way'],
     'Anh-Anh: underground hoặc tube, Anh-Mỹ: subway.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'station', 'nhà ga, trạm', 'a place where trains or buses stop', 'noun', '/ˈsteɪʃn/',
     'The station is near my house.', 'Nhà ga ở gần nhà tôi.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['train station', 'bus station', 'at the station'],
     array['terminal'],
     array[]::text[],
     array['stationary', 'stationery'],
     'Station khác stationery (văn phòng phẩm).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stop', 'dừng, điểm dừng', 'to end a movement, or a place where buses stop', 'verb', '/stɑːp/',
     'The bus stops in front of the school.', 'Xe buýt dừng trước cổng trường.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['bus stop', 'stop at', 'stop suddenly'],
     array['halt', 'pause'],
     array['start', 'go'],
     array['stopped', 'stopping', 'nonstop'],
     'Bus stop là điểm dừng xe buýt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'road', 'con đường', 'a hard path for cars and people', 'noun', '/roʊd/',
     'The road is busy in the evening.', 'Đường rất đông vào buổi tối.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['busy road', 'main road', 'road accident'],
     array['street', 'route'],
     array[]::text[],
     array['roadside', 'roadway'],
     'Road accident là tai nạn giao thông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'street', 'đường phố', 'a road in a town with buildings on each side', 'noun', '/striːt/',
     'My house is on a quiet street.', 'Nhà tôi ở trên một con phố yên tĩnh.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['busy street', 'quiet street', 'cross the street'],
     array['road'],
     array[]::text[],
     array['streets'],
     'Cross the street là băng qua đường.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'driver', 'tài xế', 'a person who drives a vehicle', 'noun', '/ˈdraɪvər/',
     'The taxi driver is very kind.', 'Bác tài xế taxi rất tốt bụng.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['taxi driver', 'bus driver', 'careful driver'],
     array['chauffeur'],
     array[]::text[],
     array['drive', 'driving'],
     'Careful driver là người lái xe cẩn thận.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'drive', 'lái xe', 'to control a vehicle', 'verb', '/draɪv/',
     'My mother drives to work every day.', 'Mẹ tôi lái xe đi làm mỗi ngày.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening', 'Writing'],
     array['drive a car', 'drive to work', 'drive carefully'],
     array['steer'],
     array[]::text[],
     array['drove', 'driven', 'driver'],
     'Quá khứ là drove, quá khứ phân từ là driven.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ride', 'đi, cưỡi', 'to travel on a bike, horse or motorbike', 'verb', '/raɪd/',
     'I ride my bike to school.', 'Tôi đạp xe đến trường.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening'],
     array['ride a bike', 'ride a motorbike', 'go for a ride'],
     array['cycle'],
     array[]::text[],
     array['rode', 'ridden', 'rider'],
     'Dùng ride cho xe hai bánh và ngựa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'passenger', 'hành khách', 'a person who travels in a vehicle but does not drive it', 'noun', '/ˈpæsɪndʒər/',
     'The bus has forty passengers.', 'Xe buýt có bốn mươi hành khách.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['bus passenger', 'train passenger', 'number of passengers'],
     array['traveller'],
     array['driver'],
     array['pass', 'passage'],
     'Number of passengers là cụm phổ biến trong Writing Task 1.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fare', 'giá vé', 'the money you pay for a journey', 'noun', '/fer/',
     'The bus fare is very cheap.', 'Giá vé xe buýt rất rẻ.',
     1.0, 'Transport', 'A1', 'Listening Section 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['bus fare', 'pay the fare', 'low fare'],
     array['price', 'cost'],
     array[]::text[],
     array['fares'],
     'Fare là tiền vé di chuyển, ticket là tờ vé.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'speed', 'tốc độ', 'how fast something moves', 'noun', '/spiːd/',
     'The train travels at high speed.', 'Tàu chạy với tốc độ cao.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['high speed', 'speed limit', 'at speed'],
     array['velocity', 'pace'],
     array[]::text[],
     array['speedy', 'speedily'],
     'Speed limit là giới hạn tốc độ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'delay', 'sự chậm trễ', 'a time when something happens later than planned', 'noun', '/dɪˈleɪ/',
     'There is a long delay at the airport.', 'Có một sự chậm trễ lớn ở sân bay.',
     1.0, 'Transport', 'A1', 'Listening Section 1 and Speaking Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['long delay', 'flight delay', 'without delay'],
     array['holdup'],
     array['punctuality'],
     array['delayed', 'delaying'],
     'Cũng là động từ: The flight is delayed.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bridge', 'cây cầu', 'a structure over a river or road', 'noun', '/brɪdʒ/',
     'We cross the bridge to the island.', 'Chúng tôi băng qua cầu ra đảo.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['cross a bridge', 'old bridge', 'long bridge'],
     array[]::text[],
     array[]::text[],
     array['bridges'],
     'Cross a bridge là băng qua cầu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'helmet', 'mũ bảo hiểm', 'a hard hat that protects your head', 'noun', '/ˈhelmɪt/',
     'Always wear a helmet on a motorbike.', 'Luôn đội mũ bảo hiểm khi đi xe máy.',
     1.0, 'Transport', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['wear a helmet', 'safety helmet', 'bike helmet'],
     array['hard hat'],
     array[]::text[],
     array['helmets'],
     'Wear a helmet là đội mũ bảo hiểm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wheel', 'bánh xe', 'a round part that turns under a vehicle', 'noun', '/wiːl/',
     'The bicycle has two wheels.', 'Chiếc xe đạp có hai bánh.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['front wheel', 'steering wheel', 'back wheel'],
     array[]::text[],
     array[]::text[],
     array['wheelchair', 'wheelbarrow'],
     'Steering wheel là vô lăng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lane', 'làn đường', 'a part of a road for one line of vehicles', 'noun', '/leɪn/',
     'There is a bicycle lane on this road.', 'Có một làn xe đạp trên con đường này.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['bicycle lane', 'bus lane', 'fast lane'],
     array['track'],
     array[]::text[],
     array['lanes'],
     'Bicycle lane là làn dành cho xe đạp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'highway', 'đường cao tốc', 'a large main road for fast traffic', 'noun', '/ˈhaɪweɪ/',
     'The highway is wide and fast.', 'Đường cao tốc rộng và nhanh.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading'],
     array['build a highway', 'highway system', 'national highway'],
     array['motorway'],
     array[]::text[],
     array['high', 'way'],
     'Anh-Anh thường dùng motorway.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pedestrian', 'người đi bộ', 'a person who walks in a street', 'noun', '/pəˈdestriən/',
     'Pedestrians cross at the traffic light.', 'Người đi bộ băng qua đường ở đèn giao thông.',
     1.0, 'Transport', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['pedestrian crossing', 'pedestrian street', 'safe for pedestrians'],
     array['walker'],
     array['driver'],
     array['pedestrians'],
     'Pedestrian crossing là vạch qua đường cho người đi bộ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'commute', 'đi làm hằng ngày', 'to travel regularly to work or school', 'verb', '/kəˈmjuːt/',
     'I commute by bus every morning.', 'Tôi đi làm bằng xe buýt mỗi sáng.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['commute to work', 'daily commute', 'long commute'],
     array['travel to work'],
     array[]::text[],
     array['commuter', 'commuting'],
     'Commuter là người đi làm xa hằng ngày.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'petrol', 'xăng', 'liquid fuel used in cars', 'noun', '/ˈpetrəl/',
     'Petrol is more expensive this year.', 'Xăng năm nay đắt hơn.',
     1.0, 'Transport', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['petrol price', 'petrol station', 'fill up with petrol'],
     array['gas', 'gasoline'],
     array[]::text[],
     array['petrol pump'],
     'Anh-Mỹ dùng gas hoặc gasoline.')
  on conflict do nothing;

end $$;
