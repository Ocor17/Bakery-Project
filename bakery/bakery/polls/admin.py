from django.contrib import admin

from .models import Choice, Question, Customers,Products,Orders,Purchase


class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3


class QuestionAdmin(admin.ModelAdmin):
    list_filter = ['pub_date']
    fieldsets = [
        (None,               {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]
    list_display = ('question_text', 'pub_date', 'was_published_recently')

admin.site.register(Question, QuestionAdmin)
admin.site.register(Customers)
admin.site.register(Products)
admin.site.register(Purchase)
admin.site.register(Orders)