-- BATCH 27 | BAND 1.0 | TOPIC: Money & Finance | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A2
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Money & Finance' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Money & Finance',
       'Từ vựng IELTS chủ đề Money & Finance cho Band 1: tiền bạc, chi tiêu, vay mượn và thanh toán cơ bản.',
       'easy', true, 'yellow')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Money & Finance' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'money', 'tiền', 'coins and notes used to buy things', 'noun', '/ˈmʌni/',
     'I save money every month.', 'Tôi tiết kiệm tiền mỗi tháng.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['save money', 'spend money', 'earn money'],
     array['cash', 'funds'],
     array[]::text[],
     array['monetary', 'moneyless'],
     'Không đếm được: some money.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'coin', 'đồng xu', 'a small round piece of metal money', 'noun', '/kɔɪn/',
     'I have a few coins in my pocket.', 'Tôi có vài đồng xu trong túi.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 (Money).',
     array['Speaking', 'Listening'],
     array['a coin', 'old coin', 'coin and note'],
     array['change'],
     array[]::text[],
     array['coins'],
     'Note là tờ tiền giấy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cash', 'tiền mặt', 'money in coins or notes', 'noun', '/kæʃ/',
     'Do you pay by cash or by card?', 'Bạn trả bằng tiền mặt hay bằng thẻ?',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['pay by cash', 'in cash', 'cash machine'],
     array['banknotes'],
     array['card'],
     array['cashier', 'cashless'],
     'Pay in cash / pay by cash đều được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wallet', 'ví nam', 'a small case for keeping money and cards', 'noun', '/ˈwɑːlɪt/',
     'I lost my wallet on the bus.', 'Tôi làm mất ví trên xe buýt.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 (Objects).',
     array['Speaking', 'Listening'],
     array['lose a wallet', 'leather wallet', 'wallet and phone'],
     array['billfold'],
     array[]::text[],
     array['wallets'],
     'Wallet thường để trong túi quần.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'purse', 'ví nữ', 'a small bag for carrying money', 'noun', '/pɜːrs/',
     'She keeps her coins in a purse.', 'Cô ấy để tiền xu trong ví.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 (Objects).',
     array['Speaking', 'Listening'],
     array['small purse', 'leather purse', 'open a purse'],
     array['handbag'],
     array[]::text[],
     array['purses'],
     'Anh-Mỹ purse còn là túi xách tay.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'borrow', 'mượn', 'to take something and give it back later', 'verb', '/ˈbɑːroʊ/',
     'I borrow money from my brother.', 'Tôi mượn tiền của anh trai.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['borrow money', 'borrow from', 'borrow a book'],
     array['take'],
     array['lend'],
     array['borrower', 'borrowing'],
     'Borrow from someone, lend to someone.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lend', 'cho vay, cho mượn', 'to give something to someone for a time', 'verb', '/lend/',
     'Can you lend me some money?', 'Bạn có thể cho tôi mượn ít tiền không?',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['lend money', 'lend to', 'lend a hand'],
     array['loan'],
     array['borrow'],
     array['lender', 'lent', 'lending'],
     'Quá khứ là lent.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'loan', 'khoản vay', 'money that you borrow from a bank', 'noun', '/loʊn/',
     'My parents take a loan to buy a house.', 'Bố mẹ tôi vay tiền để mua nhà.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['take a loan', 'bank loan', 'pay back a loan'],
     array['credit'],
     array[]::text[],
     array['loans'],
     'Take out a loan là vay tiền.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'debt', 'khoản nợ', 'money that you owe', 'noun', '/det/',
     'He is in debt because of his loan.', 'Anh ấy mắc nợ vì khoản vay.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['in debt', 'pay off a debt', 'heavy debt'],
     array['liability'],
     array['credit'],
     array['debtor'],
     'Chữ b trong debt là âm câm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'budget', 'ngân sách', 'a plan for how much money to spend', 'noun', '/ˈbʌdʒɪt/',
     'I have a small budget for travel.', 'Tôi có một ngân sách nhỏ cho việc du lịch.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['small budget', 'tight budget', 'on a budget'],
     array['plan'],
     array[]::text[],
     array['budgeting', 'budgetary'],
     'On a budget là chi tiêu hạn chế.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'income', 'thu nhập', 'money you earn or receive', 'noun', '/ˈɪnkʌm/',
     'My family has a low income.', 'Gia đình tôi có thu nhập thấp.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['low income', 'high income', 'monthly income'],
     array['earnings'],
     array['expense'],
     array['incomes'],
     'Low-income family là gia đình thu nhập thấp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'expense', 'chi phí', 'money that you spend', 'noun', '/ɪkˈspens/',
     'Rent is our biggest expense.', 'Tiền thuê nhà là khoản chi lớn nhất của chúng tôi.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['monthly expense', 'travel expenses', 'living expenses'],
     array['cost', 'spending'],
     array['income'],
     array['expensive', 'expend'],
     'Thường dùng ở số nhiều: expenses.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tax', 'thuế', 'money paid to the government', 'noun', '/tæks/',
     'People pay tax on their income.', 'Mọi người nộp thuế trên thu nhập của mình.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['pay tax', 'income tax', 'high tax'],
     array['duty'],
     array[]::text[],
     array['taxation', 'taxpayer'],
     'Cũng là động từ: tax a product.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rich', 'giàu', 'having a lot of money', 'adjective', '/rɪtʃ/',
     'He is rich but he lives simply.', 'Anh ấy giàu nhưng sống giản dị.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['rich people', 'rich country', 'get rich'],
     array['wealthy'],
     array['poor'],
     array['riches', 'richly', 'enrich'],
     'Rich in nghĩa là giàu về thứ gì.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'poor', 'nghèo', 'having very little money', 'adjective', '/pʊr/',
     'Many families in the village are poor.', 'Nhiều gia đình trong làng còn nghèo.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['poor family', 'poor country', 'poor people'],
     array['needy', 'disadvantaged'],
     array['rich'],
     array['poverty', 'poorly'],
     'Poor còn nghĩa là kém: poor quality.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wealth', 'sự giàu có', 'a large amount of money or property', 'noun', '/welθ/',
     'Wealth does not always bring happiness.', 'Sự giàu có không phải lúc nào cũng mang lại hạnh phúc.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['great wealth', 'national wealth', 'wealth gap'],
     array['riches'],
     array['poverty'],
     array['wealthy', 'wealthier'],
     'Wealth gap là khoảng cách giàu nghèo.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'invest', 'đầu tư', 'to put money into something to make a profit', 'verb', '/ɪnˈvest/',
     'My uncle invests in a small business.', 'Chú tôi đầu tư vào một doanh nghiệp nhỏ.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['invest in', 'invest money', 'invest in education'],
     array['put money into'],
     array[]::text[],
     array['investment', 'investor'],
     'Invest in + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'change', 'tiền thừa', 'the money that you get back after paying', 'noun', '/tʃeɪndʒ/',
     'Keep the change.', 'Bạn giữ lại tiền thừa nhé.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['small change', 'give change', 'keep the change'],
     array[]::text[],
     array[]::text[],
     array['changeable', 'exchange'],
     'Change còn là sự thay đổi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bill', 'hoá đơn', 'a paper that shows how much money you must pay', 'noun', '/bɪl/',
     'Please bring me the bill.', 'Làm ơn mang hoá đơn cho tôi.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['pay the bill', 'electricity bill', 'restaurant bill'],
     array['invoice'],
     array[]::text[],
     array['bills'],
     'Anh-Mỹ bill còn là tờ tiền giấy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'receipt', 'biên lai', 'a paper showing that you have paid', 'noun', '/rɪˈsiːt/',
     'Keep the receipt in case you need it.', 'Hãy giữ biên lai phòng khi cần.',
     1.0, 'Money & Finance', 'A2', 'Listening Section 1 and Speaking Part 1.',
     array['Speaking', 'Listening'],
     array['keep the receipt', 'get a receipt', 'ask for a receipt'],
     array[]::text[],
     array[]::text[],
     array['receive', 'receiving'],
     'Chữ p trong receipt là âm câm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'currency', 'tiền tệ', 'the money used in a country', 'noun', '/ˈkɜːrənsi/',
     'The currency in Japan is the yen.', 'Tiền tệ ở Nhật là đồng yên.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['foreign currency', 'local currency', 'currency exchange'],
     array['money'],
     array[]::text[],
     array['current', 'currencies'],
     'Foreign currency là ngoại tệ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'exchange', 'đổi tiền, trao đổi', 'to give one thing and get another', 'verb', '/ɪksˈtʃeɪndʒ/',
     'I exchange dollars for euros at the airport.', 'Tôi đổi đô la sang euro ở sân bay.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['exchange money', 'exchange rate', 'exchange for'],
     array['swap', 'trade'],
     array[]::text[],
     array['exchanges', 'exchangeable'],
     'Exchange rate là tỷ giá.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'afford', 'đủ khả năng chi trả', 'to have enough money to buy something', 'verb', '/əˈfɔːrd/',
     'We cannot afford a big house.', 'Chúng tôi không đủ khả năng mua một căn nhà lớn.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['can afford', 'cannot afford', 'afford to buy'],
     array[]::text[],
     array[]::text[],
     array['affordable', 'unaffordable'],
     'Thường dùng với can/cannot.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'worth', 'đáng giá', 'having a certain value', 'adjective', '/wɜːrθ/',
     'This phone is worth the price.', 'Chiếc điện thoại này đáng với giá tiền.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['worth it', 'worth the money', 'worth doing'],
     array['valuable'],
     array['worthless'],
     array['worthy', 'worthwhile'],
     'Worth + V-ing hoặc worth + tiền.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'value', 'giá trị', 'how much something is worth', 'noun', '/ˈvæljuː/',
     'Good health has great value.', 'Sức khoẻ tốt có giá trị lớn.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['great value', 'value for money', 'family values'],
     array['worth', 'importance'],
     array['worthlessness'],
     array['valuable', 'invaluable', 'valued'],
     'Value for money là đáng đồng tiền.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fee', 'phí', 'money paid for a service or entrance', 'noun', '/fiː/',
     'The school fee is not expensive.', 'Học phí không đắt.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Reading'],
     array['school fee', 'entrance fee', 'pay a fee'],
     array['charge'],
     array[]::text[],
     array['fees'],
     'Tuition fee là học phí đại học.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'payment', 'khoản thanh toán', 'the act of paying money', 'noun', '/ˈpeɪmənt/',
     'Online payment is very convenient.', 'Thanh toán trực tuyến rất tiện lợi.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['online payment', 'make a payment', 'monthly payment'],
     array['settlement'],
     array[]::text[],
     array['pay', 'payer'],
     'Make a payment là thanh toán.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'allowance', 'tiền tiêu vặt', 'money given regularly for personal use', 'noun', '/əˈlaʊəns/',
     'I get a weekly allowance from my parents.', 'Tôi được bố mẹ cho tiền tiêu vặt hàng tuần.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['weekly allowance', 'monthly allowance', 'pocket allowance'],
     array['pocket money'],
     array[]::text[],
     array['allow', 'allowable'],
     'Anh-Anh hay dùng pocket money.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'donate', 'quyên góp', 'to give money or things to help others', 'verb', '/ˈdoʊneɪt/',
     'We donate money to poor families.', 'Chúng tôi quyên góp tiền cho các gia đình nghèo.',
     1.0, 'Money & Finance', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['donate money', 'donate to charity', 'donate clothes'],
     array['give'],
     array['receive'],
     array['donation', 'donor'],
     'Donate to + tổ chức hoặc người.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'deposit', 'tiền đặt cọc, gửi tiền', 'money paid as a first payment or kept in a bank', 'noun', '/dɪˈpɑːzɪt/',
     'I pay a deposit for the apartment.', 'Tôi đặt cọc cho căn hộ.',
     1.0, 'Money & Finance', 'A2', 'Listening Section 1 and Speaking Part 1.',
     array['Speaking', 'Listening', 'Writing'],
     array['pay a deposit', 'bank deposit', 'security deposit'],
     array['down payment'],
     array['withdrawal'],
     array['depositor', 'depositing'],
     'Cũng là động từ: deposit money.')
  on conflict do nothing;

end $$;
