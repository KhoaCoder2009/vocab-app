-- BATCH 23 | BAND 1.0 | TOPIC: Housing | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Housing' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Housing',
       'Từ vựng IELTS chủ đề Housing cho Band 1: căn hộ, phòng ốc, đồ nội thất và thuê nhà cơ bản.',
       'easy', true, 'yellow')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Housing' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'apartment', 'căn hộ', 'a set of rooms in a large building', 'noun', '/əˈpɑːrtmənt/',
     'I live in a small apartment.', 'Tôi sống trong một căn hộ nhỏ.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening', 'Writing'],
     array['live in an apartment', 'rent an apartment', 'small apartment'],
     array['flat'],
     array[]::text[],
     array['apartments'],
     'Anh-Anh hay dùng flat.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'flat', 'căn hộ', 'a home on one floor of a building', 'noun', '/flæt/',
     'We live in a flat near the station.', 'Chúng tôi sống trong một căn hộ gần nhà ga.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['rent a flat', 'flat in the city', 'share a flat'],
     array['apartment'],
     array[]::text[],
     array['flatmate'],
     'Flat còn là tính từ: bằng phẳng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'room', 'phòng', 'a part of a building with walls and a door', 'noun', '/ruːm/',
     'My room is small but comfortable.', 'Phòng của tôi nhỏ nhưng thoải mái.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening', 'Writing'],
     array['living room', 'my room', 'hotel room'],
     array['space'],
     array[]::text[],
     array['roommate', 'roomy'],
     'Room còn là chỗ trống: There is no room.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bedroom', 'phòng ngủ', 'a room where you sleep', 'noun', '/ˈbedruːm/',
     'My bedroom has a big window.', 'Phòng ngủ của tôi có một cửa sổ lớn.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['my bedroom', 'share a bedroom', 'bedroom window'],
     array[]::text[],
     array[]::text[],
     array['bed', 'room'],
     'Two-bedroom apartment là căn hộ hai phòng ngủ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bathroom', 'phòng tắm', 'a room with a bath or shower', 'noun', '/ˈbæθruːm/',
     'The bathroom is next to my bedroom.', 'Phòng tắm ở cạnh phòng ngủ của tôi.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['use the bathroom', 'clean the bathroom', 'bathroom door'],
     array['toilet'],
     array[]::text[],
     array['bath', 'room'],
     'Anh-Mỹ dùng bathroom cho cả nhà vệ sinh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'roof', 'mái nhà', 'the top part of a building', 'noun', '/ruːf/',
     'The roof of our house is red.', 'Mái nhà chúng tôi màu đỏ.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['red roof', 'on the roof', 'roof of a house'],
     array[]::text[],
     array[]::text[],
     array['rooftop'],
     'Roof phát âm /ruːf/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wall', 'bức tường', 'one side of a room or building', 'noun', '/wɔːl/',
     'There is a picture on the wall.', 'Có một bức tranh trên tường.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['on the wall', 'white wall', 'wall picture'],
     array[]::text[],
     array[]::text[],
     array['walls', 'walled'],
     'Wall còn là bức tường thành.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'floor', 'sàn nhà, tầng', 'the bottom surface of a room, or a level of a building', 'noun', '/flɔːr/',
     'My apartment is on the second floor.', 'Căn hộ của tôi ở tầng hai.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening', 'Writing'],
     array['on the floor', 'ground floor', 'second floor'],
     array['storey'],
     array[]::text[],
     array['flooring'],
     'Anh-Anh: ground floor là tầng trệt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'door', 'cửa ra vào', 'a part that opens to enter a room or building', 'noun', '/dɔːr/',
     'Please close the door.', 'Làm ơn đóng cửa lại.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['open the door', 'close the door', 'front door'],
     array['entrance'],
     array[]::text[],
     array['doorway', 'doorbell'],
     'Next door là nhà bên cạnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'window', 'cửa sổ', 'an opening in a wall with glass', 'noun', '/ˈwɪndoʊ/',
     'I can see the park from my window.', 'Tôi có thể nhìn thấy công viên từ cửa sổ.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['open a window', 'window seat', 'look out of the window'],
     array[]::text[],
     array[]::text[],
     array['windowsill'],
     'Window seat là chỗ ngồi cạnh cửa sổ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stairs', 'cầu thang', 'steps that go from one floor to another', 'noun', '/sterz/',
     'I walk up the stairs to my room.', 'Tôi đi lên cầu thang tới phòng.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['walk up the stairs', 'go down the stairs', 'climb the stairs'],
     array['steps'],
     array[]::text[],
     array['staircase'],
     'Thường dùng số nhiều: stairs.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'furniture', 'đồ nội thất', 'things like tables and beds in a room', 'noun', '/ˈfɜːrnɪtʃər/',
     'We buy new furniture for the living room.', 'Chúng tôi mua đồ nội thất mới cho phòng khách.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['new furniture', 'wooden furniture', 'buy furniture'],
     array[]::text[],
     array[]::text[],
     array['furnish', 'furnished'],
     'Không đếm được: a piece of furniture.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'table', 'cái bàn', 'a piece of furniture with a flat top', 'noun', '/ˈteɪbl/',
     'We eat dinner at the kitchen table.', 'Chúng tôi ăn tối tại bàn bếp.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['dining table', 'kitchen table', 'set the table'],
     array[]::text[],
     array[]::text[],
     array['tables', 'tablecloth'],
     'Set the table là dọn bàn ăn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chair', 'cái ghế', 'a seat for one person', 'noun', '/tʃer/',
     'Sit on this chair, please.', 'Xin mời ngồi vào chiếc ghế này.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['sit on a chair', 'wooden chair', 'comfortable chair'],
     array['seat'],
     array[]::text[],
     array['chairman', 'chairs'],
     'Armchair là ghế bành.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sofa', 'ghế sofa', 'a long soft seat for two or more people', 'noun', '/ˈsoʊfə/',
     'We watch TV on the sofa.', 'Chúng tôi xem TV trên ghế sofa.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['sit on the sofa', 'comfortable sofa', 'sofa bed'],
     array['couch'],
     array[]::text[],
     array['sofas'],
     'Anh-Mỹ hay dùng couch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lamp', 'đèn', 'a light with a stand', 'noun', '/læmp/',
     'There is a lamp on my desk.', 'Có một cái đèn trên bàn học của tôi.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['desk lamp', 'table lamp', 'turn on the lamp'],
     array['light'],
     array[]::text[],
     array['lamps'],
     'Table lamp là đèn để bàn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fridge', 'tủ lạnh', 'a machine that keeps food cold', 'noun', '/frɪdʒ/',
     'The milk is in the fridge.', 'Sữa ở trong tủ lạnh.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['in the fridge', 'open the fridge', 'fridge door'],
     array['refrigerator'],
     array[]::text[],
     array['refrigerate'],
     'Fridge là dạng viết ngắn của refrigerator.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'shelf', 'cái kệ', 'a flat board on a wall for putting things on', 'noun', '/ʃelf/',
     'The books are on the shelf.', 'Những quyển sách ở trên kệ.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['book shelf', 'on the shelf', 'top shelf'],
     array['rack'],
     array[]::text[],
     array['shelves'],
     'Số nhiều là shelves.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'curtain', 'rèm cửa', 'a piece of cloth that covers a window', 'noun', '/ˈkɜːrtn/',
     'Please close the curtains.', 'Làm ơn kéo rèm lại.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['close the curtains', 'open the curtains', 'window curtain'],
     array['drape'],
     array[]::text[],
     array['curtains'],
     'Thường dùng số nhiều: curtains.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'balcony', 'ban công', 'a small place outside a window on an upper floor', 'noun', '/ˈbælkəni/',
     'I drink coffee on the balcony.', 'Tôi uống cà phê trên ban công.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['on the balcony', 'small balcony', 'balcony view'],
     array['terrace'],
     array[]::text[],
     array['balconies'],
     'Balcony view là cảnh nhìn từ ban công.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'garage', 'nhà để xe', 'a building for keeping a car', 'noun', '/ɡəˈrɑːʒ/',
     'The car is in the garage.', 'Chiếc ô tô ở trong nhà để xe.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['in the garage', 'garage door', 'car garage'],
     array[]::text[],
     array[]::text[],
     array['garages'],
     'Garage còn là xưởng sửa xe.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rent', 'thuê nhà, tiền thuê', 'to pay to use a house or room', 'verb', '/rent/',
     'We rent a small apartment in the city.', 'Chúng tôi thuê một căn hộ nhỏ trong thành phố.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['rent a flat', 'pay the rent', 'monthly rent'],
     array['lease'],
     array['buy'],
     array['renter', 'rental', 'rented'],
     'Cũng là danh từ: pay the rent.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'move', 'chuyển nhà, di chuyển', 'to change the place where you live', 'verb', '/muːv/',
     'We move to a new house next month.', 'Tháng sau chúng tôi chuyển đến nhà mới.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['move house', 'move to', 'move out'],
     array['relocate'],
     array['stay'],
     array['movement', 'moving', 'mover'],
     'Move house là chuyển nhà.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'key', 'chìa khoá', 'a small metal tool used to open a door', 'noun', '/kiː/',
     'I lost my house key.', 'Tôi làm mất chìa khoá nhà.',
     1.0, 'Housing', 'A1', 'Listening Section 1 and Speaking Part 1.',
     array['Speaking', 'Listening'],
     array['house key', 'lose a key', 'car key'],
     array[]::text[],
     array[]::text[],
     array['keys', 'keyboard'],
     'Key còn có nghĩa là then chốt: key point.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lock', 'khoá, khoá lại', 'to close something with a key', 'verb', '/lɑːk/',
     'Please lock the door when you leave.', 'Làm ơn khoá cửa khi bạn ra ngoài.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['lock the door', 'lock up', 'lock and key'],
     array['secure'],
     array['unlock'],
     array['locker', 'locked', 'unlock'],
     'Cũng là danh từ: a door lock.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ceiling', 'trần nhà', 'the top surface inside a room', 'noun', '/ˈsiːlɪŋ/',
     'The ceiling is high and white.', 'Trần nhà cao và màu trắng.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['high ceiling', 'low ceiling', 'ceiling fan'],
     array[]::text[],
     array[]::text[],
     array['ceilings'],
     'Ceiling fan là quạt trần.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'comfortable', 'thoải mái', 'pleasant and relaxing', 'adjective', '/ˈkʌmftəbl/',
     'My bed is very comfortable.', 'Giường của tôi rất thoải mái.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['comfortable chair', 'feel comfortable', 'comfortable home'],
     array['cosy'],
     array['uncomfortable'],
     array['comfort', 'comfortably', 'uncomfortable'],
     'Feel comfortable là cảm thấy thoải mái.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cosy', 'ấm cúng', 'warm, comfortable and pleasant', 'adjective', '/ˈkoʊzi/',
     'The living room is small but cosy.', 'Phòng khách nhỏ nhưng ấm cúng.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['cosy room', 'cosy home', 'warm and cosy'],
     array['snug'],
     array['cold'],
     array['cosily', 'cosiness'],
     'Anh-Mỹ viết cozy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'decorate', 'trang trí', 'to make a place look nice', 'verb', '/ˈdekəreɪt/',
     'We decorate our house for the festival.', 'Chúng tôi trang trí nhà cho ngày lễ.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['decorate a room', 'decorate the house', 'decorate with flowers'],
     array['furnish'],
     array[]::text[],
     array['decoration', 'decorative', 'decorator'],
     'Decorate with + vật trang trí.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lift', 'thang máy', 'a machine that carries people between floors', 'noun', '/lɪft/',
     'We take the lift to the tenth floor.', 'Chúng tôi đi thang máy lên tầng mười.',
     1.0, 'Housing', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['take the lift', 'in the lift', 'lift button'],
     array['elevator'],
     array['stairs'],
     array['lifted', 'lifting'],
     'Anh-Mỹ dùng elevator. Lift còn là động từ: nâng lên.')
  on conflict do nothing;

end $$;
