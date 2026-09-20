-- BATCH 10 | BAND 1.0 | TOPIC: Artificial Intelligence | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Artificial Intelligence' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Artificial Intelligence',
       'Từ vựng IELTS chủ đề Artificial Intelligence cho Band 1: AI, chatbot, dữ liệu và những ý kiến cơ bản về công nghệ thông minh.',
       'easy', true, 'purple')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Artificial Intelligence' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'artificial', 'nhân tạo', 'made by people, not natural', 'adjective', '/ˌɑːrtɪˈfɪʃl/',
     'Artificial light helps us study at night.', 'Ánh sáng nhân tạo giúp chúng ta học vào ban đêm.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['artificial light', 'artificial flowers', 'artificial intelligence'],
     array['man-made', 'synthetic'],
     array['natural'],
     array['artificially', 'artifice'],
     'Artificial intelligence (AI) là cụm quan trọng của chủ đề.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'intelligence', 'trí thông minh', 'the ability to learn and understand', 'noun', '/ɪnˈtelɪdʒəns/',
     'Artificial intelligence can answer many questions.', 'Trí tuệ nhân tạo có thể trả lời nhiều câu hỏi.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['artificial intelligence', 'human intelligence', 'high intelligence'],
     array['intellect', 'brainpower'],
     array['stupidity'],
     array['intelligent', 'unintelligent', 'intelligently'],
     'Viết tắt AI = artificial intelligence.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'intelligent', 'thông minh', 'able to learn and understand well', 'adjective', '/ɪnˈtelɪdʒənt/',
     'My friend is very intelligent.', 'Bạn tôi rất thông minh.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 2 (Describe a person).',
     array['Speaking', 'Listening', 'Writing'],
     array['intelligent person', 'highly intelligent', 'intelligent system'],
     array['clever', 'smart'],
     array['stupid', 'foolish'],
     array['intelligence', 'intelligently'],
     'Intelligent nhấn về khả năng tư duy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smart', 'thông minh', 'clever, or using computer technology', 'adjective', '/smɑːrt/',
     'A smart phone can answer my questions.', 'Điện thoại thông minh có thể trả lời câu hỏi của tôi.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['smart phone', 'smart device', 'smart student'],
     array['clever', 'bright'],
     array['stupid'],
     array['smartly', 'smartness'],
     'Smart còn nghĩa là ăn mặc chỉnh tề (Anh-Anh).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'clever', 'khéo léo, thông minh', 'quick at learning or having good ideas', 'adjective', '/ˈklevər/',
     'That is a clever idea.', 'Đó là một ý tưởng thông minh.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (People).',
     array['Speaking', 'Listening', 'Writing'],
     array['clever idea', 'clever student', 'clever trick'],
     array['smart', 'bright'],
     array['silly'],
     array['cleverly', 'cleverness'],
     'Clever thường dùng cho ý tưởng hoặc người nhanh trí.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'voice', 'giọng nói', 'the sound you make when you speak', 'noun', '/vɔɪs/',
     'The assistant has a friendly voice.', 'Trợ lý ảo có giọng nói thân thiện.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['voice message', 'in a loud voice', 'human voice'],
     array[]::text[],
     array[]::text[],
     array['voiced', 'voiceless'],
     'Voice assistant là trợ lý giọng nói.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'assistant', 'trợ lý', 'a person or program that helps you', 'noun', '/əˈsɪstənt/',
     'A voice assistant can play music for me.', 'Trợ lý giọng nói có thể phát nhạc cho tôi.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['voice assistant', 'personal assistant', 'shop assistant'],
     array['helper'],
     array[]::text[],
     array['assist', 'assistance'],
     'Assistant có thể là người hoặc phần mềm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chatbot', 'chatbot, robot trò chuyện', 'a computer program that talks with people', 'noun', '/ˈtʃætbɑːt/',
     'I ask a chatbot to help me practise English.', 'Tôi nhờ chatbot giúp tôi luyện tiếng Anh.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Part 3 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['use a chatbot', 'AI chatbot', 'chatbot answer'],
     array[]::text[],
     array[]::text[],
     array['chat', 'bot'],
     'Từ ghép: chat + robot.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'program', 'chương trình máy tính', 'a set of instructions for a computer', 'noun', '/ˈproʊɡræm/',
     'This program can translate words.', 'Chương trình này có thể dịch từ.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['computer program', 'run a program', 'learning program'],
     array['software', 'application'],
     array[]::text[],
     array['programme', 'programmer', 'programming'],
     'Anh-Anh viết programme cho chương trình TV nhưng program cho máy tính.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'software', 'phần mềm', 'programs used by a computer', 'noun', '/ˈsɔːftwer/',
     'This software is easy to use.', 'Phần mềm này dễ sử dụng.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['new software', 'computer software', 'install software'],
     array['program', 'application'],
     array['hardware'],
     array['software developer'],
     'Không đếm được: a piece of software.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'data', 'dữ liệu', 'facts and numbers used for study', 'noun', '/ˈdeɪtə/',
     'The program uses a lot of data.', 'Chương trình này dùng rất nhiều dữ liệu.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['collect data', 'use data', 'data shows'],
     array['information', 'figures'],
     array[]::text[],
     array['database', 'datum'],
     'Data thường dùng như danh từ không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'information', 'thông tin', 'facts about something', 'noun', '/ˌɪnfərˈmeɪʃn/',
     'I can find information quickly online.', 'Tôi có thể tìm thông tin nhanh chóng trên mạng.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['find information', 'useful information', 'share information'],
     array['data', 'facts'],
     array['ignorance'],
     array['inform', 'informative', 'informed'],
     'Không đếm được: some information.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'translate', 'dịch', 'to change words from one language to another', 'verb', '/trænsˈleɪt/',
     'I use an app to translate English words.', 'Tôi dùng ứng dụng để dịch từ tiếng Anh.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Language).',
     array['Speaking', 'Listening', 'Writing'],
     array['translate into', 'translate a word', 'translate a text'],
     array['interpret'],
     array[]::text[],
     array['translation', 'translator'],
     'Translate from A into B.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'language', 'ngôn ngữ', 'a system of words used by people', 'noun', '/ˈlæŋɡwɪdʒ/',
     'English is a useful language.', 'Tiếng Anh là một ngôn ngữ hữu ích.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Study).',
     array['Speaking', 'Listening', 'Writing'],
     array['foreign language', 'learn a language', 'spoken language'],
     array['tongue'],
     array[]::text[],
     array['linguist', 'linguistic'],
     'Foreign language là cụm rất hay gặp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'task', 'nhiệm vụ', 'a piece of work you must do', 'noun', '/tæsk/',
     'AI can do simple tasks for us.', 'AI có thể làm những nhiệm vụ đơn giản cho chúng ta.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['simple task', 'complete a task', 'difficult task'],
     array['job', 'duty'],
     array[]::text[],
     array['tasks'],
     'Complete a task là hoàn thành nhiệm vụ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'correct', 'đúng, sửa', 'right, or to make something right', 'adjective', '/kəˈrekt/',
     'The answer is correct.', 'Câu trả lời này đúng.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['correct answer', 'correct a mistake', 'absolutely correct'],
     array['right', 'accurate'],
     array['wrong', 'incorrect'],
     array['correction', 'correctly', 'incorrect'],
     'Cũng là động từ: correct a mistake.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wrong', 'sai', 'not right', 'adjective', '/rɔːŋ/',
     'The answer on the screen is wrong.', 'Câu trả lời trên màn hình bị sai.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['wrong answer', 'go wrong', 'something is wrong'],
     array['incorrect', 'mistaken'],
     array['right', 'correct'],
     array['wrongly', 'wrongdoing'],
     'Something is wrong nghĩa là có vấn đề.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mistake', 'lỗi sai', 'something that is not correct', 'noun', '/mɪˈsteɪk/',
     'AI can make mistakes.', 'AI có thể mắc lỗi.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['make a mistake', 'a big mistake', 'by mistake'],
     array['error', 'fault'],
     array[]::text[],
     array['mistaken', 'mistakenly'],
     'Make a mistake, không dùng do a mistake.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'idea', 'ý tưởng', 'a thought or plan', 'noun', '/aɪˈdiːə/',
     'AI can give me new ideas for my project.', 'AI có thể cho tôi những ý tưởng mới cho dự án.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['good idea', 'new idea', 'have an idea'],
     array['thought', 'plan'],
     array[]::text[],
     array['ideal', 'idealistic'],
     'Have an idea là nảy ra ý tưởng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'think', 'nghĩ', 'to use your mind to make ideas', 'verb', '/θɪŋk/',
     'I think AI is useful for study.', 'Tôi nghĩ AI hữu ích cho việc học.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Part 3 (Opinions).',
     array['Speaking', 'Listening', 'Writing'],
     array['think about', 'think of', 'I think that'],
     array['consider', 'believe'],
     array[]::text[],
     array['thought', 'thinker', 'thinking'],
     'I think... là cách mở đầu ý kiến rất phổ biến.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'know', 'biết', 'to have information in your mind', 'verb', '/noʊ/',
     'I know how to use this program.', 'Tôi biết cách dùng chương trình này.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['know how to', 'know about', 'let me know'],
     array['understand'],
     array['ignore'],
     array['knowledge', 'known', 'knowing'],
     'Chữ k đầu là âm câm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'understand', 'hiểu', 'to know the meaning of something', 'verb', '/ˌʌndərˈstænd/',
     'The chatbot can understand my question.', 'Chatbot có thể hiểu câu hỏi của tôi.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['understand a question', 'fully understand', 'understand well'],
     array['grasp', 'get'],
     array['misunderstand'],
     array['understanding', 'understandable', 'misunderstand'],
     'Quá khứ là understood.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'control', 'điều khiển', 'to make a machine or person do what you want', 'verb', '/kənˈtroʊl/',
     'People can control robots with their voices.', 'Con người có thể điều khiển robot bằng giọng nói.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['control a machine', 'remote control', 'under control'],
     array['manage', 'operate'],
     array['lose control'],
     array['controller', 'controlled', 'uncontrolled'],
     'Cũng là danh từ: lose control.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'copy', 'sao chép', 'to make the same thing again', 'verb', '/ˈkɑːpi/',
     'Do not copy answers from AI.', 'Đừng sao chép đáp án từ AI.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['copy and paste', 'copy a file', 'copy someone'],
     array['duplicate', 'imitate'],
     array['create'],
     array['copier', 'copyright'],
     'Copy and paste rất quen thuộc trên máy tính.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'search', 'tìm kiếm', 'to look for information or something', 'verb', '/sɜːrtʃ/',
     'I search for information on my phone.', 'Tôi tìm thông tin trên điện thoại.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['search for', 'search engine', 'search online'],
     array['look for', 'seek'],
     array[]::text[],
     array['researcher', 'research'],
     'Search for something là tìm kiếm cái gì.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'result', 'kết quả', 'something that happens because of an action', 'noun', '/rɪˈzʌlt/',
     'The search result is very useful.', 'Kết quả tìm kiếm rất hữu ích.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['search result', 'test result', 'as a result'],
     array['outcome', 'consequence'],
     array['cause'],
     array['resultant', 'resulting'],
     'As a result là cụm liên kết ý trong Writing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'trust', 'tin tưởng', 'to believe someone or something is good or true', 'verb', '/trʌst/',
     'I do not always trust AI answers.', 'Tôi không phải lúc nào cũng tin câu trả lời của AI.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['trust someone', 'trust in', 'trust AI'],
     array['rely on', 'believe'],
     array['distrust'],
     array['trustworthy', 'mistrust', 'trusted'],
     'Cũng là danh từ: build trust.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'future', 'tương lai', 'the time that will come after now', 'noun', '/ˈfjuːtʃər/',
     'AI will be more important in the future.', 'AI sẽ quan trọng hơn trong tương lai.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['in the future', 'near future', 'bright future'],
     array[]::text[],
     array[]::text[],
     array['futuristic'],
     'In the future rất phổ biến trong Speaking Part 3.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'worry', 'lo lắng', 'to feel afraid about a problem', 'verb', '/ˈwʌri/',
     'Some people worry about robots.', 'Một số người lo lắng về robot.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['worry about', 'do not worry', 'a big worry'],
     array['fear', 'be concerned'],
     array['relax'],
     array['worried', 'worrying', 'worrisome'],
     'Worry about + danh từ hoặc V-ing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'danger', 'mối nguy hiểm', 'the chance that something bad will happen', 'noun', '/ˈdeɪndʒər/',
     'Some people see danger in AI.', 'Một số người thấy nguy hiểm trong AI.',
     1.0, 'Artificial Intelligence', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['in danger', 'danger to', 'danger of'],
     array['risk', 'threat'],
     array['safety'],
     array['dangerous', 'endanger', 'dangerously'],
     'Danger to + đối tượng, danger of + V-ing.')
  on conflict do nothing;

end $$;
