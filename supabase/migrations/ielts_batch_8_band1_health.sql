-- BATCH 8 | BAND 1.0 | TOPIC: Health | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Health' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Health',
       'Từ vựng IELTS chủ đề Health cho Band 1: bộ phận cơ thể, bệnh thường gặp và khám chữa bệnh.',
       'easy', true, 'teal')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Health' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'health', 'sức khoẻ', 'the condition of your body and mind', 'noun', '/helθ/',
     'Good health is very important.', 'Sức khoẻ tốt rất quan trọng.',
     1.0, 'Health', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['good health', 'health problem', 'health care'],
     array['wellbeing'],
     array['illness'],
     array['healthy', 'unhealthy', 'healthily'],
     'Health là danh từ không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'doctor', 'bác sĩ', 'a person who treats sick people', 'noun', '/ˈdɑːktər/',
     'I see a doctor when I am ill.', 'Tôi đi khám bác sĩ khi tôi bị bệnh.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['see a doctor', 'family doctor', 'call a doctor'],
     array['physician'],
     array['patient'],
     array['doctoral', 'doctorate'],
     'See a doctor nghĩa là đi khám bác sĩ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'nurse', 'y tá', 'a person who takes care of sick people', 'noun', '/nɜːrs/',
     'The nurse is very kind.', 'Cô y tá rất tốt bụng.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['nurse and doctor', 'school nurse', 'a kind nurse'],
     array[]::text[],
     array[]::text[],
     array['nursing', 'nursery'],
     'Cũng là động từ: nurse a patient.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hospital', 'bệnh viện', 'a place where sick people get treatment', 'noun', '/ˈhɑːspɪtl/',
     'My mother works in a hospital.', 'Mẹ tôi làm việc ở bệnh viện.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['go to hospital', 'in hospital', 'hospital bed'],
     array['clinic'],
     array[]::text[],
     array['hospitalise'],
     'Anh-Anh: in hospital, Anh-Mỹ: in the hospital.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'medicine', 'thuốc', 'a substance used to treat illness', 'noun', '/ˈmedsn/',
     'I take medicine when I have a fever.', 'Tôi uống thuốc khi bị sốt.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['take medicine', 'cough medicine', 'modern medicine'],
     array['drug', 'pill'],
     array[]::text[],
     array['medical', 'medicinal'],
     'Take medicine, không dùng eat medicine.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ill', 'ốm', 'not well in your body', 'adjective', '/ɪl/',
     'My brother is ill today.', 'Hôm nay anh trai tôi bị ốm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['feel ill', 'fall ill', 'be ill'],
     array['sick', 'unwell'],
     array['well', 'healthy'],
     array['illness'],
     'Ill trang trọng hơn sick trong Anh-Anh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sick', 'ốm, buồn nôn', 'not well or feeling like vomiting', 'adjective', '/sɪk/',
     'I stay at home when I am sick.', 'Tôi ở nhà khi tôi bị ốm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['feel sick', 'get sick', 'sick leave'],
     array['ill', 'unwell'],
     array['healthy', 'well'],
     array['sickness', 'sickly'],
     'Feel sick còn có nghĩa là buồn nôn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pain', 'cơn đau', 'the feeling you have when part of your body hurts', 'noun', '/peɪn/',
     'I have a pain in my back.', 'Tôi bị đau lưng.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['feel pain', 'back pain', 'in pain'],
     array['ache'],
     array['comfort'],
     array['painful', 'painless', 'painkiller'],
     'In pain nghĩa là đang bị đau.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'headache', 'đau đầu', 'a pain in your head', 'noun', '/ˈhedeɪk/',
     'I have a headache after studying.', 'Tôi bị đau đầu sau khi học.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['have a headache', 'bad headache', 'get a headache'],
     array[]::text[],
     array[]::text[],
     array['head', 'ache'],
     'Headache còn dùng nghĩa bóng là điều phiền toái.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fever', 'sốt', 'a high body temperature', 'noun', '/ˈfiːvər/',
     'My sister has a fever and a cough.', 'Em gái tôi bị sốt và ho.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['have a fever', 'high fever', 'fever and cough'],
     array['temperature'],
     array[]::text[],
     array['feverish'],
     'Have a fever là cách nói quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cough', 'ho', 'to push air noisily out of your throat', 'verb', '/kɔːf/',
     'I cough when I catch a cold.', 'Tôi ho khi bị cảm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['cough loudly', 'bad cough', 'cough medicine'],
     array[]::text[],
     array[]::text[],
     array['coughing'],
     'Cough có nhiều cách phát âm: gh đọc /f/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cold', 'cảm lạnh', 'a common illness with a cough and running nose', 'noun', '/koʊld/',
     'I have a cold today.', 'Hôm nay tôi bị cảm lạnh.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['catch a cold', 'have a cold', 'common cold'],
     array['flu'],
     array[]::text[],
     array['coldly', 'coldness'],
     'Cold còn là tính từ: cold weather.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'body', 'cơ thể', 'the physical form of a person', 'noun', '/ˈbɑːdi/',
     'Exercise is good for your body.', 'Tập thể dục tốt cho cơ thể bạn.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['human body', 'body and mind', 'body weight'],
     array['physique'],
     array['mind'],
     array['bodily', 'bodies'],
     'Body and mind là cụm hay dùng trong Writing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'head', 'cái đầu', 'the top part of your body', 'noun', '/hed/',
     'I have pain in my head.', 'Tôi bị đau ở đầu.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['shake your head', 'head teacher', 'headache'],
     array[]::text[],
     array[]::text[],
     array['header', 'heading'],
     'Head cũng là người đứng đầu: head of a school.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'eye', 'con mắt', 'the part of the body that you see with', 'noun', '/aɪ/',
     'My eyes hurt when I read too long.', 'Mắt tôi đau khi đọc quá lâu.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['close your eyes', 'eye doctor', 'keep an eye on'],
     array[]::text[],
     array[]::text[],
     array['eyesight', 'eyebrow'],
     'Keep an eye on nghĩa là để mắt tới.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hand', 'bàn tay', 'the part of your body at the end of your arm', 'noun', '/hænd/',
     'Wash your hands before eating.', 'Hãy rửa tay trước khi ăn.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['wash your hands', 'in hand', 'give a hand'],
     array[]::text[],
     array[]::text[],
     array['handy', 'handful'],
     'Give someone a hand nghĩa là giúp đỡ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'leg', 'cái chân', 'the part of your body used for walking', 'noun', '/leɡ/',
     'My leg hurts after running.', 'Chân tôi đau sau khi chạy.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['broken leg', 'leg pain', 'long legs'],
     array[]::text[],
     array[]::text[],
     array['legs'],
     'Leg là cả chân, foot là bàn chân.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tooth', 'cái răng', 'one of the hard white parts in your mouth', 'noun', '/tuːθ/',
     'I brush my teeth twice a day.', 'Tôi đánh răng hai lần mỗi ngày.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['brush your teeth', 'tooth pain', 'lose a tooth'],
     array[]::text[],
     array[]::text[],
     array['teeth', 'toothache', 'toothbrush'],
     'Số nhiều bất quy tắc là teeth.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dentist', 'nha sĩ', 'a doctor who cares for your teeth', 'noun', '/ˈdentɪst/',
     'I visit the dentist twice a year.', 'Tôi đi khám nha sĩ hai lần mỗi năm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['visit the dentist', 'go to the dentist', 'dentist appointment'],
     array[]::text[],
     array[]::text[],
     array['dental', 'dentistry'],
     'Go to the dentist là đi khám răng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hurt', 'đau, làm đau', 'to feel or cause pain', 'verb', '/hɜːrt/',
     'My back hurts after football.', 'Lưng tôi đau sau khi đá bóng.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['hurt badly', 'feel hurt', 'hurt yourself'],
     array['ache', 'injure'],
     array['heal'],
     array['hurtful', 'hurting'],
     'Quá khứ và quá khứ phân từ đều là hurt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rest', 'nghỉ ngơi', 'to stop working and relax', 'verb', '/rest/',
     'I rest at home when I am ill.', 'Tôi nghỉ ngơi ở nhà khi bị ốm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['take a rest', 'get some rest', 'rest well'],
     array['relax'],
     array['work'],
     array['restful', 'restless'],
     'Take a rest, không dùng do a rest.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'recover', 'hồi phục', 'to become well again after illness', 'verb', '/rɪˈkʌvər/',
     'My mother recovers quickly from a cold.', 'Mẹ tôi hồi phục nhanh sau khi bị cảm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['recover from', 'recover quickly', 'fully recover'],
     array['heal', 'get better'],
     array['worsen'],
     array['recovery', 'recoverable'],
     'Recover from + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'patient', 'bệnh nhân', 'a person who receives medical treatment', 'noun', '/ˈpeɪʃnt/',
     'The doctor talks to each patient.', 'Bác sĩ nói chuyện với từng bệnh nhân.',
     1.0, 'Health', 'A1', 'Listening Section 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['treat a patient', 'hospital patient', 'patient care'],
     array[]::text[],
     array[]::text[],
     array['patience', 'patiently'],
     'Patient còn là tính từ: kiên nhẫn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'clinic', 'phòng khám', 'a place where people get medical care', 'noun', '/ˈklɪnɪk/',
     'There is a small clinic near my house.', 'Có một phòng khám nhỏ gần nhà tôi.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['health clinic', 'local clinic', 'go to the clinic'],
     array['surgery'],
     array[]::text[],
     array['clinical', 'clinician'],
     'Clinic nhỏ hơn hospital.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'appointment', 'cuộc hẹn', 'an arranged time to see someone', 'noun', '/əˈpɔɪntmənt/',
     'I have an appointment with the doctor.', 'Tôi có cuộc hẹn với bác sĩ.',
     1.0, 'Health', 'A1', 'Listening Section 1 (Booking).',
     array['Speaking', 'Listening'],
     array['make an appointment', 'doctor appointment', 'cancel an appointment'],
     array['booking'],
     array[]::text[],
     array['appoint', 'appointed'],
     'Make an appointment là đặt lịch hẹn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'weak', 'yếu', 'not strong', 'adjective', '/wiːk/',
     'I feel weak when I am ill.', 'Tôi cảm thấy yếu khi bị ốm.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['feel weak', 'weak body', 'weak point'],
     array['feeble'],
     array['strong'],
     array['weakness', 'weaken', 'weakly'],
     'Weak point là điểm yếu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fit', 'khoẻ mạnh', 'healthy and strong from exercise', 'adjective', '/fɪt/',
     'I run every day to stay fit.', 'Tôi chạy mỗi ngày để giữ dáng khoẻ mạnh.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['stay fit', 'keep fit', 'get fit'],
     array['in shape', 'healthy'],
     array['unfit'],
     array['fitness', 'fitting'],
     'Stay fit là cụm rất hữu ích.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'temperature', 'nhiệt độ', 'how hot or cold something is', 'noun', '/ˈtemprətʃər/',
     'The nurse checks my temperature.', 'Cô y tá đo nhiệt độ của tôi.',
     1.0, 'Health', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Writing'],
     array['high temperature', 'take your temperature', 'body temperature'],
     array[]::text[],
     array[]::text[],
     array['temperate'],
     'Have a temperature cũng có nghĩa là bị sốt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'vitamin', 'vi-ta-min', 'a substance in food that is good for your body', 'noun', '/ˈvaɪtəmɪn/',
     'Fruit has a lot of vitamins.', 'Trái cây có nhiều vi-ta-min.',
     1.0, 'Health', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['vitamin C', 'take vitamins', 'rich in vitamins'],
     array[]::text[],
     array[]::text[],
     array['vitamins'],
     'Vitamin C thường xuất hiện trong bài đọc về sức khoẻ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'safe', 'an toàn', 'not in danger', 'adjective', '/seɪf/',
     'It is safe to walk here.', 'Đi bộ ở đây rất an toàn.',
     1.0, 'Health', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['feel safe', 'stay safe', 'safe place'],
     array['secure'],
     array['dangerous', 'unsafe'],
     array['safety', 'safely', 'save'],
     'Stay safe là lời chúc khi tạm biệt.')
  on conflict do nothing;

end $$;
