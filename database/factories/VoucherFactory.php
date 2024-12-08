<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Voucher>
 */
class VoucherFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'voucher_number' => fake()->unique()->numberBetween(1000, 1000000000),
            'voucher_provider' => fake()->randomElement(['foo', 'bar']),
            'voucher_amount' => fake()->randomElement([10.0, 20.0]),
            'expires_at' => fake()->dateTimeBetween('now', '+1 year'),
            'used' => false,
        ];
    }
}
