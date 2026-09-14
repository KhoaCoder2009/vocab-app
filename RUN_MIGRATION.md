# Hướng dẫn chạy Migration: Thêm english_definition

## Bước 1: Truy cập Supabase Dashboard

1. Đăng nhập: https://supabase.com/dashboard
2. Chọn project: **kdwrwzazspqdazvlzcsn**
3. Vào **SQL Editor** (biểu tượng ⚡ ở sidebar)

## Bước 2: Chạy SQL Migration

Copy và paste đoạn SQL này vào SQL Editor, sau đó click **Run**:

```sql
-- Add english_definition column to vocabularies table
-- Định nghĩa tiếng Anh giúp học từ trong context tiếng Anh

ALTER TABLE public.vocabularies 
ADD COLUMN IF NOT EXISTS english_definition text;

COMMENT ON COLUMN public.vocabularies.english_definition IS 'English definition of the word (for learning in English context)';
```

## Bước 3: Verify

Chạy query này để kiểm tra:

```sql
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'vocabularies'
  AND column_name = 'english_definition';
```

Kết quả mong đợi:
```
column_name          | data_type | is_nullable
---------------------|-----------|------------
english_definition   | text      | YES
```

## Bước 4: (Optional) Update dữ liệu mẫu

Nếu muốn thêm định nghĩa tiếng Anh cho các từ hiện tại:

```sql
-- Ví dụ: Update một số từ
UPDATE public.vocabularies 
SET english_definition = 'The process of interaction among people, companies, and governments worldwide'
WHERE word = 'globalization';

UPDATE public.vocabularies 
SET english_definition = 'A person who is studying or has expert knowledge of one or more sciences'
WHERE word = 'scientist';
```

## Hoàn thành!

Sau khi chạy migration, restart dev server:

```bash
npm run dev
```

UI sẽ hiển thị:
- **PracticePage**: Định nghĩa tiếng Anh (màu violet) + Nghĩa tiếng Việt
- **ReviewPage**: Định nghĩa tiếng Anh (màu teal) + Nghĩa tiếng Việt

---

**Note:** File migration gốc: `supabase/migrations/0002_add_english_definition.sql`
