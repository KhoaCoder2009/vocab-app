-- BATCH 5 | BAND 1.0 | TOPIC: Hobbies & Free Time | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Hobbies & Free Time' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Hobbies & Free Time',
       'Từ vựng IELTS chủ đề Hobbies & Free Time cho Band 1: sở thích, giải trí và hoạt động lúc rảnh.',
       'easy', true, 'purple')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Hobbies & Free Time' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hobby', 'sở thích', 'an activity you enjoy doing in your free time', 'noun', '/ˈhɑːbi/',
     'My hobby is taking photos.', 'Sở thích của tôi là chụp ảnh.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['have a hobby', 'take up a hobby', 'favourite hobby'],
     array['pastime', 'interest'],
     array[]::text[],
     array['hobbyist'],
     'Take up a hobby là bắt đầu một sở thích.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'interest', 'sự quan tâm', 'a feeling of wanting to know or do something', 'noun', '/ˈɪntrəst/',
     'I have an interest in music.', 'Tôi quan tâm đến âm nhạc.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening', 'Writing'],
     array['interest in', 'show interest', 'lose interest'],
     array['curiosity'],
     array['boredom'],
     array['interested', 'interesting', 'interestingly'],
     'Have an interest in + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'music', 'âm nhạc', 'sounds made by singing or playing instruments', 'noun', '/ˈmjuːzɪk/',
     'I listen to music every day.', 'Tôi nghe nhạc mỗi ngày.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Music).',
     array['Speaking', 'Listening'],
     array['listen to music', 'play music', 'pop music'],
     array[]::text[],
     array[]::text[],
     array['musical', 'musician'],
     'Không đếm được: không nói musics.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'song', 'bài hát', 'a short piece of music with words', 'noun', '/sɔːŋ/',
     'My favourite song is very slow.', 'Bài hát yêu thích của tôi rất chậm.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Music).',
     array['Speaking', 'Listening'],
     array['favourite song', 'sing a song', 'love song'],
     array['tune'],
     array[]::text[],
     array['songwriter'],
     'Sing a song, không dùng play a song khi hát.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sing', 'hát', 'to make music with your voice', 'verb', '/sɪŋ/',
     'I sing with my friends.', 'Tôi hát cùng bạn bè.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['sing a song', 'sing well', 'sing together'],
     array[]::text[],
     array[]::text[],
     array['sang', 'sung', 'singer'],
     'Quá khứ là sang, quá khứ phân từ là sung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dance', 'nhảy múa', 'to move your body to music', 'verb', '/dæns/',
     'My sister likes to dance.', 'Chị tôi thích nhảy múa.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['dance to music', 'dance with', 'go dancing'],
     array[]::text[],
     array[]::text[],
     array['dancer', 'dancing'],
     'Cũng là danh từ: a dance class.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'guitar', 'đàn ghi-ta', 'a musical instrument with strings', 'noun', '/ɡɪˈtɑːr/',
     'My brother plays the guitar.', 'Anh trai tôi chơi ghi-ta.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Music).',
     array['Speaking', 'Listening'],
     array['play the guitar', 'learn guitar', 'guitar lesson'],
     array[]::text[],
     array[]::text[],
     array['guitarist'],
     'Dùng the khi nói chơi nhạc cụ: play the guitar.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'piano', 'đàn piano', 'a large musical instrument with black and white keys', 'noun', '/piˈænoʊ/',
     'I practise the piano after school.', 'Tôi luyện đàn piano sau giờ học.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Music).',
     array['Speaking', 'Listening'],
     array['play the piano', 'piano lesson', 'piano music'],
     array[]::text[],
     array[]::text[],
     array['pianist'],
     'Piano học được cần luyện tập đều đặn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'draw', 'vẽ', 'to make a picture with a pencil or pen', 'verb', '/drɔː/',
     'I draw pictures in my free time.', 'Tôi vẽ tranh trong thời gian rảnh.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['draw a picture', 'draw well', 'draw a map'],
     array['sketch'],
     array[]::text[],
     array['drew', 'drawn', 'drawing'],
     'Draw cũng có nghĩa là rút ra (draw a conclusion).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'paint', 'tô màu, sơn', 'to make a picture with colours', 'verb', '/peɪnt/',
     'She paints flowers and trees.', 'Cô ấy vẽ hoa và cây.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Art).',
     array['Speaking', 'Listening'],
     array['paint a picture', 'paint a wall', 'paint with colours'],
     array[]::text[],
     array[]::text[],
     array['painter', 'painting'],
     'Paint cũng là danh từ: red paint.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'picture', 'bức tranh, hình ảnh', 'a drawing, painting or photo', 'noun', '/ˈpɪktʃər/',
     'This picture is very beautiful.', 'Bức tranh này rất đẹp.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 2 (Objects).',
     array['Speaking', 'Listening', 'Writing'],
     array['draw a picture', 'take a picture', 'beautiful picture'],
     array['image', 'photo'],
     array[]::text[],
     array['pictorial'],
     'Take a picture nghĩa là chụp ảnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'photo', 'ảnh', 'a picture taken with a camera', 'noun', '/ˈfoʊtoʊ/',
     'I take a photo of my family.', 'Tôi chụp ảnh gia đình.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['take a photo', 'family photo', 'photo album'],
     array['photograph'],
     array[]::text[],
     array['photography', 'photographer'],
     'Photo là dạng viết ngắn của photograph.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'camera', 'máy ảnh', 'a machine for taking photos', 'noun', '/ˈkæmərə/',
     'I use my phone camera every day.', 'Tôi dùng máy ảnh điện thoại mỗi ngày.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['digital camera', 'phone camera', 'use a camera'],
     array[]::text[],
     array[]::text[],
     array['cameraman'],
     'Nhấn âm đầu: CAM-e-ra.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'game', 'trò chơi', 'an activity with rules that people play for fun', 'noun', '/ɡeɪm/',
     'We play a card game at home.', 'Chúng tôi chơi một trò chơi bài ở nhà.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['play a game', 'video game', 'board game'],
     array[]::text[],
     array[]::text[],
     array['gamer', 'gaming'],
     'Game còn chỉ trận đấu thể thao.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chess', 'cờ vua', 'a board game for two players', 'noun', '/tʃes/',
     'My grandfather plays chess with me.', 'Ông tôi chơi cờ vua với tôi.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['play chess', 'chess game', 'chess club'],
     array[]::text[],
     array[]::text[],
     array['chessboard'],
     'Không dùng mạo từ: play chess.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'puzzle', 'câu đố, trò xếp hình', 'a game where you solve a problem', 'noun', '/ˈpʌzl/',
     'I do puzzles on the weekend.', 'Tôi chơi xếp hình vào cuối tuần.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['do a puzzle', 'jigsaw puzzle', 'solve a puzzle'],
     array['riddle'],
     array[]::text[],
     array['puzzled', 'puzzling'],
     'Cũng là động từ: This puzzles me.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'walk', 'đi bộ', 'to move on foot', 'verb', '/wɔːk/',
     'I walk in the park every evening.', 'Tôi đi bộ trong công viên mỗi tối.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening'],
     array['go for a walk', 'walk in the park', 'walk to school'],
     array['stroll'],
     array['run'],
     array['walker', 'walking'],
     'Go for a walk là cụm rất tự nhiên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'garden', 'khu vườn', 'a piece of land with flowers, plants or grass', 'noun', '/ˈɡɑːrdn/',
     'My grandmother has a small garden.', 'Bà tôi có một khu vườn nhỏ.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['in the garden', 'flower garden', 'work in the garden'],
     array['yard'],
     array[]::text[],
     array['gardener', 'gardening'],
     'Gardening là làm vườn, một sở thích phổ biến.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fishing', 'câu cá', 'the activity of catching fish', 'noun', '/ˈfɪʃɪŋ/',
     'My uncle loves fishing at the lake.', 'Chú tôi thích câu cá ở hồ.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['go fishing', 'fishing trip', 'fishing rod'],
     array[]::text[],
     array[]::text[],
     array['fish', 'fisherman'],
     'Go fishing là cách nói tự nhiên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'collect', 'sưu tầm', 'to bring things together as a hobby', 'verb', '/kəˈlekt/',
     'I collect old coins.', 'Tôi sưu tầm tiền xu cũ.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['collect stamps', 'collect coins', 'collect information'],
     array['gather'],
     array[]::text[],
     array['collection', 'collector'],
     'Collect còn dùng trong nghiên cứu: collect data.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'relax', 'thư giãn', 'to rest and feel calm', 'verb', '/rɪˈlæks/',
     'I relax by listening to music.', 'Tôi thư giãn bằng cách nghe nhạc.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening', 'Writing'],
     array['relax at home', 'relax after work', 'time to relax'],
     array['unwind'],
     array['stress'],
     array['relaxed', 'relaxing', 'relaxation'],
     'Relax là từ khóa hay dùng khi nói về sở thích.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'enjoy', 'thích, tận hưởng', 'to get pleasure from something', 'verb', '/ɪnˈdʒɔɪ/',
     'I enjoy reading in my free time.', 'Tôi thích đọc sách vào thời gian rảnh.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening', 'Writing'],
     array['enjoy doing', 'enjoy the weekend', 'enjoy yourself'],
     array['like', 'love'],
     array['dislike'],
     array['enjoyable', 'enjoyment'],
     'Enjoy + V-ing, không dùng enjoy to V.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fun', 'niềm vui, vui', 'enjoyment or pleasure', 'noun', '/fʌn/',
     'Playing games with friends is fun.', 'Chơi trò chơi với bạn bè rất vui.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['have fun', 'great fun', 'fun activity'],
     array['enjoyment'],
     array['boredom'],
     array['funny'],
     'Have fun là lời chúc quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'favourite', 'yêu thích', 'liked more than others', 'adjective', '/ˈfeɪvərɪt/',
     'Football is my favourite sport.', 'Bóng đá là môn thể thao yêu thích của tôi.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['favourite colour', 'favourite food', 'my favourite'],
     array['preferred'],
     array[]::text[],
     array['favour', 'favoured'],
     'Anh-Mỹ viết favorite.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'spend', 'dành, tiêu', 'to use time or money', 'verb', '/spend/',
     'I spend two hours a day on my hobby.', 'Tôi dành hai tiếng mỗi ngày cho sở thích.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening', 'Writing'],
     array['spend time', 'spend money', 'spend the weekend'],
     array['use', 'pass'],
     array['save', 'waste'],
     array['spent', 'spending', 'expense'],
     'Spend time doing something.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boring', 'chán, nhàm', 'not interesting', 'adjective', '/ˈbɔːrɪŋ/',
     'Some games are boring for me.', 'Một số trò chơi thật nhàm chán với tôi.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['boring job', 'boring film', 'boring day'],
     array['dull'],
     array['interesting', 'exciting'],
     array['bore', 'bored', 'boredom'],
     'Boring mô tả điều gây chán, bored mô tả cảm giác.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'exciting', 'thú vị, hào hứng', 'making you feel happy and interested', 'adjective', '/ɪkˈsaɪtɪŋ/',
     'Swimming in the sea is exciting.', 'Bơi ở biển rất thú vị.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['exciting game', 'exciting news', 'really exciting'],
     array['thrilling'],
     array['boring'],
     array['excite', 'excited', 'excitement'],
     'Exciting mô tả sự việc, excited mô tả người.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'join', 'tham gia', 'to become a member of a group', 'verb', '/dʒɔɪn/',
     'I join a music club at school.', 'Tôi tham gia câu lạc bộ âm nhạc ở trường.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening', 'Writing'],
     array['join a club', 'join in', 'join a team'],
     array['take part in'],
     array['leave'],
     array['joint', 'joiner'],
     'Join + tân ngữ, không dùng join to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'club', 'câu lạc bộ', 'a group of people with the same interest', 'noun', '/klʌb/',
     'My friend goes to a chess club.', 'Bạn tôi đi đến câu lạc bộ cờ vua.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['join a club', 'sports club', 'book club'],
     array['society', 'group'],
     array[]::text[],
     array['clubhouse'],
     'Club còn là gậy đánh golf trong thể thao.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'free time', 'thời gian rảnh', 'time when you are not working or studying', 'noun', '/ˌfriː ˈtaɪm/',
     'I read in my free time.', 'Tôi đọc sách vào thời gian rảnh.',
     1.0, 'Hobbies & Free Time', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening', 'Writing'],
     array['in my free time', 'spare time', 'have free time'],
     array['spare time', 'leisure'],
     array['work time'],
     array['free', 'freedom'],
     'Câu hỏi hay gặp: What do you do in your free time?')
  on conflict do nothing;

end $$;
