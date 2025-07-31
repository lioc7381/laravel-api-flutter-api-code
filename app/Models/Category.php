<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Builder;

class Category extends Model
{
    use HasFactory;
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function transactions(): HasMany
    {
        return $this->hasMany(Transaction::class);
    }

    protected $fillable = ['name', 'user_id'];

    protected static function booted(): void
    {
        if (auth()->check()) {
            static::addGlobalScope('by_user', function (Builder $builder) {
                $builder->where('user_id', auth()->id());
            });
        }
    }
}
