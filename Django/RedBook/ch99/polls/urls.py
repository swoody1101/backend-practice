from django.urls import path
from . import views

app_name = "polls"
urlpatterns = [
    path("polls/", views.index, name="index"),
    path("polls/<int:question_id>/", views.detail, name="details"),
    path("polls/<int:quetion_id>/results/", views.results, name="results"),
    path("polls/<int:question_id>/vote/", views.vote, name="vote"),
]
