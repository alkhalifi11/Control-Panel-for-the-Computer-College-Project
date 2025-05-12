// تجاهل بعض التحذيرات المتعلقة بالأفضلية في كتابة الكود
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// استيراد مكتبة Flutter الأساسية
import 'package:flutter/material.dart';
// استيراد مكون القائمة الجانبية
import 'package:leftapp_1/app/components/Drawr.dart';

// تعريف صفحة StatelessWidget لعرض معلومات حول التطبيق
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم
    return Scaffold(
      // تعريف شريط التطبيق
      appBar: AppBar(
        // إضافة خلفية متدرجة لشريط التطبيق
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF053661), Color(0xFF0A74DA)], // الألوان
              begin: Alignment.topLeft, // بداية التدرج
              end: Alignment.bottomRight, // نهاية التدرج
            ),
          ),
        ),
        toolbarHeight: 120, // ارتفاع شريط التطبيق
        iconTheme: IconThemeData(
          color: Colors.white, // لون أيقونة القائمة الجانبية
          size: 33, // تكبير حجم أيقونة القائمة الجانبية
        ),
        title: Text(
          'حول التطبيق', // عنوان الصفحة
          style: TextStyle(
              color: Colors.white, // لون النص
              fontSize: 24, // حجم النص
              fontWeight: FontWeight.w900), // سماكة النص
        ),
        centerTitle: true, // توسيط العنوان
      ),
      drawer: drawerapp(), // إضافة القائمة الجانبية
      body: Container(
        padding: EdgeInsets.all(10), // الحواف الداخلية
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // محاذاة النصوص إلى اليسار
          children: [
            Text(
              "تطبيق كلية الحاسوب - جامعة شبوة", // عنوان التطبيق
              style: TextStyle(
                fontSize: 22, // حجم النص
                fontWeight: FontWeight.bold, // سماكة النص
                color: Colors.blueAccent, // لون النص
              ),
            ),
            SizedBox(height: 15), // مسافة بين العناصر
            Text(
              "هذا التطبيق هو أداة مبتكرة تهدف إلى تسهيل حياة الطلاب والموظفين في كلية الحاسوب بجامعة شبوة. "
              "يوفر التطبيق وصولاً سريعًا وسهلاً إلى المعلومات الأكاديمية والإدارية، مثل الجداول الدراسية، "
              "إعلانات الكلية، ونتائج الامتحانات.", // وصف التطبيق
              style: TextStyle(
                fontSize: 16, // حجم النص
                height: 1.5, // ارتفاع الأسطر
              ),
            ),
            SizedBox(height: 20), // مسافة بين العناصر
            Text(
              "وظيفة التطبيق:", // عنوان فرعي
              style: TextStyle(
                fontSize: 18, // حجم النص
                fontWeight: FontWeight.bold, // سماكة النص
                color: Colors.blueAccent, // لون النص
              ),
            ),
            SizedBox(height: 10), // مسافة بين العناصر
            Column(
              children: [
                Text(
                  " يعتبر هذا التطبيق لوحة تحكم كاملة في قاعدة بيانات المشروع بحيث يعرض فيه كل البيانات المخزنة في القاعدة ويمكن الاضافة لها او تعديلها او حذفها. \n ", // وصف الوظيفة
                  style: TextStyle(
                    fontSize: 16, // حجم النص
                  ),
                ),
                Text(
                  "ملاحظة(1) : يتم ادارة لوحة التحكم هذه من قبل المستخدمين الذين لديهم صلاحيات معينة، مثل المدرسين والموظفين الإداريين.\n", // ملاحظة
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // سماكة النص
                    fontSize: 16, // حجم النص
                  ),
                ),
              ],
            ),
            SizedBox(height: 5), // مسافة بين العناصر
            Text(
              "ملاحظة(2) : تم تطوير التطبيق بواسطة فريق من طلاب الكلية كجزء من مشروع تخرجهم، "
              "ويهدف إلى تحسين تجربة الطلاب في الكلية.", // ملاحظة إضافية
              style: TextStyle(
                fontSize: 16, // حجم النص
                fontWeight: FontWeight.bold, // سماكة النص
                height: 1.5, // ارتفاع الأسطر
              ),
            ),
            SizedBox(height: 20), // مسافة بين العناصر
            Text(
              "طرق التواصل مع فريق التطوير:", // عنوان فرعي
              style: TextStyle(
                fontSize: 18, // حجم النص
                fontWeight: FontWeight.bold, // سماكة النص
                color: Colors.blueAccent, // لون النص
              ),
            ),
            SizedBox(height: 10), // مسافة بين العناصر
            Row(
              children: [
                Icon(Icons.email,
                    color: Colors.blueAccent), // أيقونة البريد الإلكتروني
                SizedBox(width: 10), // مسافة بين الأيقونة والنص
                Text(
                  "ahmedalkhalifi31@gmail.com", // البريد الإلكتروني
                  style: TextStyle(fontSize: 16), // حجم النص
                ),
              ],
            ),
            SizedBox(height: 10), // مسافة بين العناصر
            Row(
              children: [
                Icon(Icons.phone, color: Colors.blueAccent), // أيقونة الهاتف
                SizedBox(width: 10), // مسافة بين الأيقونة والنص
                Text(
                  "+967-775-295-345", // رقم الهاتف
                  style: TextStyle(fontSize: 16), // حجم النص
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
