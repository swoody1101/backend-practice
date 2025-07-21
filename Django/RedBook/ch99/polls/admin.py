from django.contrib import admin
from polls.models import Question, Choice


# Register your models here.
class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        ("Question Statement", {"fields": ["question_text"]}),
        ("Date Information", {"fields": ["pub_date"]}),
    ]


admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice)
